.title bandgap vref vs. vdd spice test program(tt)
.inc 'models/misc.cdl'
.inc 'models/Bandgap.cdl'
.inc 'models/OTA.cdl'
.inc 'models/comparator.cdl'
.inc 'models/subADAC.cdl'

.param a=3.3
xA gnda vdd vss vref vIref Bandgapb
vvdd vdd 0 a
vvss vss 0 b
v2 gnda 0 0

.option post accurate probe
.op
.temp 27
.dc a 0 3.3 0.1 b 0 -3.3 -0.1
*.probe dc v(Vref)
.probe dc v(vref) v(vIref)

.lib 'models\ms018_v1p7.lib' tt
.lib 'models\ms018_v1p7.lib' res_tt
.lib 'models\ms018_v1p7.lib' mim_tt
.lib 'models\ms018_v1p7.lib' bjt_tt

.alter .title bandgap vref vs. vdd spice test program(ss)
.del lib 'models\ms018_v1p7.lib' tt
.del lib 'models\ms018_v1p7.lib' res_tt
.del lib 'models\ms018_v1p7.lib' mim_tt
.del lib 'models\ms018_v1p7.lib' bjt_tt

.lib 'models\ms018_v1p7.lib' ss
.lib 'models\ms018_v1p7.lib' res_ss
.lib 'models\ms018_v1p7.lib' mim_ss
.lib 'models\ms018_v1p7.lib' bjt_ss

.alter .title bandgap vref vs. vdd spice test program(ff)
.del lib 'models\ms018_v1p7.lib' ss
.del lib 'models\ms018_v1p7.lib' res_ss
.del lib 'models\ms018_v1p7.lib' mim_ss
.del lib 'models\ms018_v1p7.lib' bjt_ss

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.end