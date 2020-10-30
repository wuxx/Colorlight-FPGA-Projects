#!/bin/sh
# first file is toplevel file

for file in $*
do
  echo "read_verilog ${file}"
done
