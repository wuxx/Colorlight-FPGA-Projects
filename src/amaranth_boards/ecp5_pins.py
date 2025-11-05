#!/bin/env python

import sys
import csv

path = "docs/FPGA-SC-02034-3-0-ECP5U-45-Pinout.csv"

#
#

def read_pinout(path, device, connectors=None):
    print(f"open('{path}')", file=sys.stderr)
    f = open(path)

    # Skip the headers
    i = 0
    for line in f:
        if i == 7:
            break
        i += 1

    reader = csv.DictReader(f)

    pin_ball = {}
    pairs = {}

    for row in reader:
        #print(row)
        d = row['Differential']
        if d == '-':
            continue
        p = row[device]
        if p == '-':
            continue
        pb = row['Pin/Ball']
        assert not pb in pin_ball
        pin_ball[pb] = p
        relation, _, other = d.split("_")
        if relation == 'True':
            pairs[pb] = other
        elif relation == 'Comp':
            pairs[other] = pb
        else:
            assert 0, relation

    pin_pairs = {}

    for k,v in pairs.items():
        try:
            #print(pin_ball[k], pin_ball[v])
            pin_pairs[pin_ball[k]] = pin_ball[v]
        except KeyError as ex:
            #print("Error", k, v, file=sys.stderr)
            pass

    valid = []

    if not connectors:
        for k, v in pin_pairs.items():
            valid.append(f"{k} {v}")

        return valid

    for k, v in connectors:
        connector = []
        for conn, pin in v:
            if conn.startswith('pmod'):
                connector.append(pin)
        for pin in connector:
            pair = pin_pairs.get(pin)
            if pair in connector:
                print("pair", k, pin, pair, file=sys.stderr)
                valid.append(pin + " " + pair)
    return valid

#
#

if __name__ == "__main__":
    print("Identify LVDS pairs on the dev board", file=sys.stderr)
    from colorlight_i9_r7_2 import Colorlight_i9_R72Platform as Platform

    connectors = [ (c,p) for c,p in Platform().connectors.items() if c[0] == 'pmod' ]
    v = read_pinout(path, device="CABGA381", connectors=connectors)

# FIN
