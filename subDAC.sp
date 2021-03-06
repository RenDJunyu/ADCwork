.title test
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'
.include 'models/SHmodel.cdl'
.include 'models/comparator.cdl'
.include 'models/subADAC.cdl'

xclk vddl vssl clkin clk1 clk1d clk2 clk2d / CLOCKa
$xr1 0 vddh vssh vref vIref / Bandgapb 
xsh vddl vssl clk1 vin SHout / LSH
$xsubADC vref vIref clk1d vddl vssl SHout out1 out2 out3 out4 out5 out6 / subADC
xsubDAC vref vIref vddl vssl vin out1 out2 out3 out4 out5 out6 out / subDAC

vvref vref 0 1.6
vvIref vIref 0 -1.6
vclk clkin 0 pulse(-1.8 1.8 0.1n 0.1n 0.1n 500n 1u)
vvddh vddh 0 3.3
vvssh vssh 0 -3.3
vvddl vddl 0 1.8
vvssl vssl 0 -1.8
vgnd gnd 0 0

vvin vin 0 pwl 0 -1.6,40u 1.6,80u -1.6
vout1 out1 0 pwl 0 -1.6,7.499u -1.6,7.5u 1.6,72.5u 1.6,72.501u -1.6
vout2 out2 0 pwl 0 -1.6,12.499u -1.6,12.5u 1.6,67.5u 1.6,67.501u -1.6
vout3 out3 0 pwl 0 -1.6,17.499u -1.6,17.5u 1.6,62.5u 1.6,62.501u -1.6
vout4 out4 0 pwl 0 -1.6,22.499u -1.6,22.5u 1.6,57.5u 1.6,57.501u -1.6
vout5 out5 0 pwl 0 -1.6,27.499u -1.6,27.5u 1.6,52.5u 1.6,52.501u -1.6
vout6 out6 0 pwl 0 -1.6,32.499u -1.6,32.5u 1.6,47.5u 1.6,47.501u -1.6

$.ic v(xsh.vc)=0
.option post accurate probe
.op
.temp 27
.tran 0.1n 80u
.probe v(clk1) v(clk1d) v(clk2d) v(vin) v(SHout) v(xsubDAC.preout) v(out)
.probe v(out1) v(out2) v(out3) v(out4) v(out5) v(out6)
.measure powerall avg power

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff

.end