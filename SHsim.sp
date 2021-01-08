.title test
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'
.include 'models/SHmodel.cdl'
.include 'models/comparator.cdl'
.include 'models/subADAC.cdl'

xsh vddl vssl clkin vin SHout / LSH
xs0 vddl vssl clkin vin out / BOOSTRAP


vvref vref 0 1.6
vvIref vIref 0 -1.6
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
.tran 0.1n 50u
.probe v(vin) v(SHout) v(out)
.measure powerall avg power

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff

.end