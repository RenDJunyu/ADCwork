.title test
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'
.include 'models/SHmodel.cdl'


xclk vdd vss clkin clk1 clk1d clk2 clk2d / CLOCKa
xsh 0 vdd vss clk1 clk1d clk2d vin out / SH

vclk clkin 0 pulse(-1.8 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdd vdd 0 1.8
vvss vss 0 -1.8
vvin vin 0 1$sin 0 0.1 50k

.option post accurate probe
.op
.temp 27
.tran 0.1n 20u
.probe v(clk1) v(clk1d) v(clk2d) v(vin) v(out)
.measure powerall avg power

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff

.end