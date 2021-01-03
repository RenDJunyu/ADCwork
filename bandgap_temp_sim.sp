.title bandgap temperature-coefficient spice test program (tt)
.include 'models\Bandgap.cdl'
	//包含网表文件
x1 gnda vdda vref Bandgap	//调用网表文件
vl vdda 0 3.3	//电源电压
v2 gnda 0 0	//地电压
.option post accurate probe	//仿真选项
.op	//静态工作点分析语句
.temp 25	//仿真温度设定语句
.dc temp -40 125 0.1	//温度扫描设定语句
.probe dc v(Vref) i(x1.MPM3) 	//打印选定节点电压和电流语句
.meas dc max_value max v(Vref) 	//测试语句，得到最大值
.meas dc min_value min v(Vref) 	//测试语句，得到最小值
.meas dc avg_value avg v(Vref) 	//测试语句，得到平均值
.meas dc temp_coeff param='(max_value-min_value)/165/max_value*1000000'	//计算温度系数
.lib 'models\ms018.lib' tt
$.lib 'models\ms018.lib' res_tt 
$.lib 'models\ms018.lib' mim_tt 
.lib 'models\ms018.lib' bjt_tt

.alter .title bandgap psrr spice test program(ss)
.del lib 'models\ms018.lib' tt
$.del lib 'models\ms018.lib1' res_tt
$.del lib 'models\ms018.lib' mim_tt
.del lib 'models\ms018.lib' bjt_tt
.lib 'models\ms018.lib' ss 
$.lib 'models\ms018.lib' res_ss 
$.lib 'models\ms018.lib' mim_ss 
.lib 'models\ms018.lib' bjt_ss 
.alter .title bandgap psrr spice test program(ff) 
.del lib 'models\ms018.lib' ss
$.del lib 'models\ms018.lib' res ss
$.del lib 'models\ms018.lib1' mim_ss
.del lib 'models\ms018.lib' bjt_ss

.lib 'models\ms018.lib' ff
$.lib 'models\ms018.lib' res_ff
$.lib 'models\ms018.lib' mim_ff
.lib 'models\ms018.lib' bjt_ff
.end
