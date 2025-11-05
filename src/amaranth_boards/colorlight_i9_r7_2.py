#!/bin/env python

import os
import subprocess

from amaranth.build import *
from amaranth.vendor._lattice import LatticePlatform
from amaranth_boards.resources import *


__all__ = ["Colorlight_i9_R72Platform"]

class Colorlight_i9_R72Platform(LatticePlatform):
    device                 = "LFE5U-45F"
    package                = "BG381"
    speed                  = "6"
    default_clk            = "clk25"

    # Pins according to https://github.com/wuxx/Colorlight-FPGA-Projects/blob/master/colorlight_i9_v7.2.md 
    # Some of these still need verifying.

    resources = [
        Resource("clk25", 0, Pins("P3", dir="i"), Clock(25e6), Attrs(IO_TYPE="LVCMOS33")),

        *LEDResources(pins="L2", invert = True,
                      attrs=Attrs(IO_TYPE="LVCMOS33", DRIVE="4")),

        # SPIFlash (W25Q64JVSIQ) 8-MB
        Resource("spi_flash", 0,
            Subsignal("cs",   PinsN("R2", dir="o")),
            Subsignal("clk",  Pins("U3", dir="i")),
            Subsignal("cipo", Pins("V2", dir="i")),             # Chip: DI/IO0
            Subsignal("copi", Pins("W2", dir="o")),             #       DO/IO1
            # Subsignal("wp", PinsN("unknown", dir="o")),     #          IO2 Todo
            # Subsignal("hold", PinsN("unknown", dir="o")),   #          IO3 Todo
            Attrs(IO_TYPE="LVCMOS33")
        ),

        # 1x M12L64322A 8MB SDRAM (512K x 32 Bit x 4 Banks)
        SDRAMResource(0,
            clk="B9", we_n="A10", cas_n="A9", ras_n="B10",
            ba="B11 C8", a="B13 C14 A16 A17 B16 B15 A14 A13 A12 A11 B12",
            dq="B6 A5 A6 A7 C7 B8 B5 A8 D8 D7 E8 D6 C6 D5 E7 C5 "
            "C10 D9 E11 D11 C11 D12 E9 C12 E14 C15 E13 D16 E12 B17 D14 D13",
            attrs=Attrs(PULLMODE="NONE", DRIVE="4", SLEWRATE="FAST", IO_TYPE="LVCMOS33")
        ),

        # 2x Broadcom B50612D Gigabit Ethernet PHYs
        Resource("eth_rgmii", 0,
            Subsignal("rst",     PinsN("P4", dir="o")),
            Subsignal("mdc",     Pins("N5", dir="o")),
            Subsignal("mdio",    Pins("P5", dir="io")),
            Subsignal("tx_clk",  Pins("U19", dir="o")),
            Subsignal("tx_ctl",  Pins("P19", dir="o")),
            Subsignal("tx_data", Pins("U20 T19 T20 R20", dir="o")),
            Subsignal("rx_clk",  Pins("L19", dir="i")),
            Subsignal("rx_ctl",  Pins("M20", dir="i")),
            Subsignal("rx_data", Pins("P20 N19 N20 M19", dir="i")),
            Attrs(IO_TYPE="LVCMOS33")
        ),

        Resource("eth_rgmii", 1,
            Subsignal("rst",     PinsN("P4", dir="o")),
            Subsignal("mdc",     Pins("N5", dir="o")),
            Subsignal("mdio",    Pins("P5", dir="io")),
            Subsignal("tx_clk",  Pins("G1", dir="o")),
            Subsignal("tx_ctl",  Pins("K1", dir="o")),
            Subsignal("tx_data", Pins("G2 H1 J1 J3", dir="o")),
            Subsignal("rx_clk",  Pins("H2", dir="i")),
            Subsignal("rx_ctl",  Pins("P2", dir="i")),
            Subsignal("rx_data", Pins("K2 L1 N1 P1", dir="i")),
            Attrs(IO_TYPE="LVCMOS33")
        ),

    ]

    # Adapter Board
    connectors = [
        Connector("p",  2, "- - - - K18  L2 T18 C18 R17 R18 M17 P17 U18 T17 - - P18 U17 - - - - N18 N17 L20 M18 K20 L18 J20 G20"),
        Connector("p",  3, "- - - - D20 F20 B19 B20 A19 B18 A18 C17  D3  C4 - -  C3  B4 - - - -  A3  E3  B1  C2  D2  C1  E2  D1"),
        Connector("p",  4, "- - - -  E1  F2  E4  F1  F3  G3  H3  H4  H5  J4 - -  J5  K3 - - - -  A2  K5  K4  B3  B2 E19   -   -"),
        Connector("p",  5, "- - - -  F4  E5  E6  F5 D16  G5 D17 D18 E17 E16 - - F16 F17 - - - - E18 G16 F18 H16 G18 H17 H18 J17"),
        Connector("p",  6, "- - - - J18 J16 P16  L5  L4  M4  N4  R3  T3  M3 - -  T2  N3 - - - -  N2  M1  V1  W1  Y2  U1  T1  R1"),
        # P2
        Connector("pmod", 0, "P17 R18 C18 L2 - - M17 R17 T18 K18"),
        Connector("pmod", 1, "J20 L18 M18 N17 - - G20 K20 L20 N18"),
        # P3
        Connector("pmod", 2, "C17 B18 B20 F20 - - A18 A19 B19 D20"),
        Connector("pmod", 3, "D1  C1  C2  E3 - -  E2  D2  B1  A3"),
        # P4
        Connector("pmod", 4, "H4 G3 F1 F2 - - H3 F3 E4 E1"),
        Connector("pmod", 5, "- E19 B3 K5 - - - B2 K4 A2"),
        # P5
        Connector("pmod", 6, "D18 G5 F5 E5 - - D17 D16 E6 F4"),
        Connector("pmod", 7, "J17 H17 H16 G16 - - H18 G18 F18 E18"),
        # P6
        Connector("pmod", 8, "R3 M4 L5 J16 - - N4 L4 P16 J18"),
        Connector("pmod", 9, "R1 U1 W1 M1 - - T1 Y2 V1 N2"),
    ]
 
    @property
    def required_tools(self):
        return super().required_tools + [
            "openFPGALoader"
        ]

    def toolchain_prepare(self, fragment, name, **kwargs):
        overrides = dict(ecppack_opts="--compress")
        overrides.update(kwargs)
        return super().toolchain_prepare(fragment, name, **overrides)

    def toolchain_program(self, products, name):
        tool = os.environ.get("OPENFPGALOADER", "openFPGALoader")
        with products.extract("{}.bit".format(name)) as bitstream_filename:
            subprocess.check_call([tool, "-c", "cmsisdap", "-f", bitstream_filename])


if __name__ == "__main__":
    from amaranth_boards.test.blinky import Blinky
    Colorlight_i9_R72Platform().build(Blinky(), do_program=True)

