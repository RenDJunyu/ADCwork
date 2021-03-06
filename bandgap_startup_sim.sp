.title bandgap start-up spice test program(tt)
.inc 'models/misc.cdl'
.inc 'models/Bandgap.cdl'
.inc 'models/OTA.cdl'
.inc 'models/comparator.cdl'
.inc 'models/subADAC.cdl'
x1 0 vdda vssa vref vIref Bandgapb
v1 vdda 0 pwl 0 0 1u 0 3u 3.3
v2 vssa 0 pwl 0 0 1u 0 3u -3.3
.option post accurate probe
.op
.temp 25
.probe tran v(Vref) v(VIref) v(vdda)
.tran 1n 6u

.lib 'models\ms018_v1p7.lib' tt
.lib 'models\ms018_v1p7.lib' res_tt
.lib 'models\ms018_v1p7.lib' mim_tt
.lib 'models\ms018_v1p7.lib' bjt_tt

.alter .title bandgap start-up spice test program(ss)
.del lib 'models\ms018_v1p7.lib' tt
.del lib 'models\ms018_v1p7.lib' res_tt
.del lib 'models\ms018_v1p7.lib' mim_tt
.del lib 'models\ms018_v1p7.lib' bjt_tt

.lib 'models\ms018_v1p7.lib' ss
.lib 'models\ms018_v1p7.lib' res_ss
.lib 'models\ms018_v1p7.lib' mim_ss
.lib 'models\ms018_v1p7.lib' bjt_ss

.alter .title bandgap start-up spice test program(ff)
.del lib 'models\ms018_v1p7.lib' ss
.del lib 'models\ms018_v1p7.lib' res_ss
.del lib 'models\ms018_v1p7.lib' mim_ss
.del lib 'models\ms018_v1p7.lib' bjt_ss

.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.end
