.title bandgap start-up spice test program(tt)
.include 'models\Bandgap.cdl'
x1 gnda vdda vref Bandgap
v1 vdda 0 pwl 0 0 1u 0 3u 3.3
v2 gnda 0 0
.option post accurate probe
.op
.temp 25
.probe tran v(Vref) v(vdda)
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
