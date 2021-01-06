.title bandgap vref vs. vdd spice test program(tt)
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'

.param a=3.3
x1 gnda vdda vref Bandgapa
* 来个运放反向
v1 vdda 0 a
v2 gnda 0 0
v3 vdda2 0 -1.8
.option post accurate probe
.op
.temp 27
.dc a 0 3.3 0.1
*.probe dc v(Vref)
.print dc v(out)

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