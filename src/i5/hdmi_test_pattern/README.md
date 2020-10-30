# ULX3S HDMI Test Patterm Generator

I've taken the idea of a low-level video generator from Dan Gisselquist's
[llvga.v](https://github.com/ZipCPU/vgasim/blob/master/rtl/llvga.v) module
and also the
[HDMI code from Emard](https://github.com/DoctorWkt/Verilog_tic-tac-toe/tree/master/HDMI), and I've created a _llhdmi.v_ video generating module.

I have also taken Dan Gisselquist's
[vgatestsrc.v](https://github.com/ZipCPU/vgasim/blob/master/rtl/vgatestsrc.v)
test pattern generator, and built a ULX3S project that displays the test
pattern on the HDMI output.

To do this, ```make -f UMakefile```.

There is also a make with Verilator, ```make -f Makefile```. This uses the
test pattern generator and produces the image file ```image.ppm```.

The _dec_6_2018.jpg_ image is a photo of the first output from the project.
On Dec 10, 2018, I updated the _vgatestsrc.v_ from ZipCPU, added a reset
line and re-imported _TMDS_encoder.v_. This time, I decorated the file
with some ```/* verilator lint_off UNOPTFLAT */``` lines because the
code that sets ```q_m``` really isn't right. I've fixed this by creating
separate wires and bundling them together afterwards. The _dec_10_2018.jpg_
image shows the current HDMI output from the project.

