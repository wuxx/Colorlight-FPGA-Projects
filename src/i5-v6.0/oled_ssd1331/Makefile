VERILOG = top_checkered.v oled_video.v
DEVICE = 25k
IDCODE = 0x41111043   # 25f

PIN_DEF ?= top.lpf

BUILDDIR = bin

compile: $(BUILDDIR)/toplevel.bit

prog: $(BUILDDIR)/toplevel.bit
	dapprog $^

$(BUILDDIR)/toplevel.json: $(VERILOG)
	mkdir -p $(BUILDDIR)
	yosys -p "synth_ecp5 -abc9 -json $@" $^

$(BUILDDIR)/%.config: $(PIN_DEF) $(BUILDDIR)/toplevel.json
	 nextpnr-ecp5 --${DEVICE} --package CABGA381 --freq 25 --textcfg  $@ --json $(filter-out $<,$^) --lpf $< 

$(BUILDDIR)/toplevel.bit: $(BUILDDIR)/toplevel.config
	ecppack --compress $^ $@

clean:
	rm -rf ${BUILDDIR}

.SECONDARY:
.PHONY: compile clean prog
