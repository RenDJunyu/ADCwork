.title bandgap psrr spice test program(tt) 
.inc1ude 'E:\hspice_book\net1ist\Bandgap.cdl'
x1 gnda vdda vref Bandgap
v1 vdda 0 3.3 ac 1
v2 gnda 0 0
.option post accurate probe
.op
.temp 25
.ac dec 100 2 10Meg
.meas ac psrr find vdb(Vref) at 1k
.probe ac vdb(Vref)
.lib 'E:\models\hspice\ms018_lib' tt
.lib 'E:\models\hspice\ms018_v1p9.lib1' res_tt
.lib 'E:\models\hspice\ms018_v1p9.lib' mim_tt
.lib 'E:\models\hspice\ms018_v1p9.1ib' bjt_tt

.alter .title bandgap psrr spice test program(ss)
.del lib 'E:\models\hspice\ms018_v1p9.lib' tt
.del lib 'E:\models\hspice\ms018_v1p9.lib1' res_tt
.del lib 'E:\models\hspice\ms018_v1p9.lib' mim_tt
.del lib 'E:\models\hspice\ms018_v1p9.lib' bjt_tt
.lib 'E:\models\hspice\ms018_v1p9.lib' ss 
.lib 'E:\models\hspice\msQ18_v1p9.lib' res_ss 
.lib 'E:\models\hspice\ms018_v1p9.lib' mim_ss 
.lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ss 
.alter .title bandgap psrr spice test program(ff) 
.del lib 'E:\models\hspice\ms018_v1p9.1ib' ss
.del lib 'E:\models\hspice\ms018 v1p9.1ib' res ss
.del lib 'E:\models\hspice\ms018_v1p9.lib1' mim_ss
.del lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ss

.lib 'E:\models\hspice\ms018_v1p9.lib' ff
.lib 'E:\models\hspice\ms018_v1p9.lib' res_ff
.lib 'E:\models\hspice\ms018_v1p9.lib' mim_ff
.lib 'E:\models\hspice\ms018_v1p9.lib' bjt_ff
.end
