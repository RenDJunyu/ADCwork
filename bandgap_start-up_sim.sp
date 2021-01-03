.title bandgap start-up spice test program(tt)
.inc1ude 'E:\net1ist\Bandgap.cdl'
x1 gnda vdda vref Bandgap
vl vdda 0 pwl 0 0 1u 0 3u 3.3
v2 gnda 0 0
.option post accurate probe
.op
.temp 25
.probe tran v(Vref) v(vdda)
.tran 1n 6u
.lib 'E:\models\hspice\ms018_v1p9.lib' tt
.lib 'E:\models\hspice\ms018_v1p9.lib' res_tt
.lib 'E:\models\hspice\ms018_v1p9.lib' mim_tt
.lib 'E:\models\hspice\ms018_v1p9.lib' bjt_tt

.alter .title bandgap start-up spice test program(ss)
.del lib 'E:\models\hspice\ms018_v1p9.lib1' tt
.del lib 'E:\models\hspice\ms018_v1p9.lib1' res_tt
.del lib 'E:\models\hspice\ms018_v1p9.lib1' mim_tt
.del lib 'E:\models\hspice\ms018_v1p9.lib' bjt_tt

.lib 'E:\models\hspice\ms018_v1p9.lib' ss
.lib 'E:\models\hspice\ms018_v1p9.lib' res_ss
.lib 'E:\models\hspice\ms018_v1p9.lib' mim_ss
.lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ss

.alter .title bandgap start-up spice test program(ff)
.del lib 'E:\models\hspice\ms018_v1p9.lib1' ss
.del lib 'E:\models\hspice\ms018_v1p9.lib' res_ss
.del lib 'E:\models\hspxce\ms018_v1p9.lib' mim_ss
.del lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ss

.lib 'E:\models\hspice\ms018_v1p9.lib' ff
.lib 'E:\models\hspice\ms018_v1p9.lib1' res_ff
.lib 'E:\models\hspice\ms018_v1p9.lib1' mim_ff
.lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ff
.end
