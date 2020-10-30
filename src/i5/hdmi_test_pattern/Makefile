YOSYS=yosys
NEXTPNR=nextpnr-ecp5
ECPPACK=ecppack
HDMICODE=DVI_3x3.v
HDMICODE=llhdmi.v vgatestsrc.v
ENCODER=TMDS_encoder.v

.PHONY: all
all: ulx3s_25f_ULX3S_25F.bit

ULX3S_25F.ys: ULX3S_25F.v $(HDMICODE) $(ENCODER) clock.v OBUFDS.v
	chmod +x ysgen.sh
	./ysgen.sh ULX3S_25F.v  $(HDMICODE) $(ENCODER) clock.v \
		OBUFDS.v  > ULX3S_25F.ys
	echo "hierarchy -top ULX3S_25F" >> ULX3S_25F.ys
	echo "synth_ecp5 -json ULX3S_25F.json" >> ULX3S_25F.ys

ULX3S_25F.json: ULX3S_25F.ys
	$(YOSYS) -q ULX3S_25F.ys

ulx3s_25f_ULX3S_25F.config: ULX3S_25F.json
	$(NEXTPNR) --25k --package CABGA381 --json ULX3S_25F.json --lpf ulx3s_v20_segpdi.lpf \
	--textcfg ulx3s_25f_ULX3S_25F.config

ulx3s_25f_ULX3S_25F.bit: ulx3s_25f_ULX3S_25F.config
	$(ECPPACK) --input ulx3s_25f_ULX3S_25F.config \
		--bit ulx3s_25f_ULX3S_25F.bit
        
.PHONY: clean
clean:
	rm -f ULX3S_25F.ys ULX3S_25F.json ulx3s_25f_ULX3S_25F.config \
		ulx3s_25f_ULX3S_25F.bit
