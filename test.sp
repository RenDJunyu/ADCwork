.title test
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'
.include 'models/SHmodel.cdl'
.include 'models/comparator.cdl'
.include 'models/subADAC.cdl'

xclk vddl vssl clkin clk1 clk1d clk2 clk2d / CLOCKa
xr1 0 vddh vssh vref vIref / Bandgapb 
xsh vddl vssl clkin vin SHout / LSH
xsubADC vref vIref clkin vddl vssl SHout out1 out2 out3 out4 out5 out6 / subADC
xsubDAC vref vIref vddl vssl vin out1 out2 out3 out4 out5 out6 out / subDAC

Mt1 out1 out1 vss vss n18 W=4u L=1u m=1
Mt2 out2 out2 vss vss n18 W=4u L=1u m=1
Mt3 out3 out3 vss vss n18 W=4u L=1u m=1
Mt4 out4 out4 vss vss n18 W=4u L=1u m=1
Mt5 out5 out5 vss vss n18 W=4u L=1u m=1
Mt6 out6 out6 vss vss n18 W=4u L=1u m=1

xfo1 out1 fo1 fo1 vddl vssl / OPAMP
xfo2 out2 fo2 fo2 vddl vssl / OPAMP
xfo3 out3 fo3 fo3 vddl vssl / OPAMP
xfo4 out4 fo4 fo4 vddl vssl / OPAMP
xfo5 out5 fo5 fo5 vddl vssl / OPAMP
xfo6 out6 fo6 fo6 vddl vssl / OPAMP
Rfo1 fon1 fo1 10M
Rfo2 fon2 fo2 10M
Rfo3 fon3 fo3 10M
Rfo4 fon4 fo4 10M
Rfo5 fon5 fo5 10M
Rfo6 fon6 fo6 10M

vclk clkin 0 pulse(-1.8 1.8 0.1n 0.1n 0.1n 500n 1u)
vvddh vddh 0 3.3
vvssh vssh 0 -3.3
vvddl vddl 0 1.8
vvssl vssl 0 -1.8
vvin vin 0 sin 0 1.2 40k
vgnd gnd 0 0

$.ic v(xsh.vc)=0
.option post accurate probe
.op
.temp 27
.tran 0.1n 25u
$.probe v(clk1) v(clk1d) v(clk2d) v(vin) v(out) v(xsh.vC) v(xsh.Vx)
.probe v(clk1) v(clk1d) v(clk2d) v(vin) v(SHout) v(out)
.probe v(out1) v(out2) v(out3) v(out4) v(out5) v(out6)
.probe v(xsubDAC.ina) v(xsubDAC.inb) v(xsubDAC.inc) v(xsubDAC.ind) v(xsubDAC.ine) v(xsubDAC.inf)
.measure powerall avg power

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff

.end