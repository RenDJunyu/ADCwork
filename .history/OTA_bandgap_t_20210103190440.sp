.title OTA of bandgap ac simulation program
.SUBCKT OTA_bandgap Idc_10u gnda out vdda vin vip
MNM3 out net17 gnda gnda n33 W=6u L=700n m=3
MNM1 net13 net13 gnda gnda n33 W=5u L=1u m=2
MNM0 net17 net13 gnda gnda n33 W=5u L=1u m=2
MPM4 out Idc_10u vdda vdda p33 W=3u L=1u m=6
MPM3 net17 vip net32 vdda p33 W=20u L=2000n m=4
MPM2 net13 vin net32 vdda p33 W=20u L=2000n m=4
MPM1 Idc_10u Idc_10u vdda vdda p33 W=3u L=1u m=4
MPM0 net32 Idc_10u vdda vdda p33 W=3u L=1u m=6
CC0 out net9 1.1p
RR0 net9 net17 12K
.ENDS OTA_bandgap

x1 Idc_10u gnda out vdda vin vip OTA_bandgap
v1 vdda 0 3.3	$//电源电压3.3V
v2 gnda 0 0	$//地电压0V
v3 vip 0 0.73 ac 1 0	$//正输入端，共模电压0.73V,交流电压1V，相位0度
v4 vin 0 0.73 ac 1 180	$//负输入端，共模电压0.73V,交流电压1V，相位180度
i1 Idc_10u gnda 3u	$//电流源3uA
c1 out 0 0.2p	$//输出等效负载电容
.noise v(out) v3 10	$//OTA噪声分析语句
.option post accurate probe	$//仿真选项设置
.op	$//静态工作点分析语句
.temp 25	$//仿真温度设置
.ac dec 100 10 100Meg 	$//OTA交流分析语句
.probe ac vdb(out) vp(out)	$//打印OTA的增益和相位曲线
.probe noise inoise onoise 	$//打印OTA的输入输出噪声曲线
.lib 'models\ms018.lib' tt 	$//定义MOS管工艺角 
$.lib 'models\ms018.lib' res_tt	//定义电阻工艺角
$.lib 'models\ms018.lib' mim_tt	//定义MIM电容工艺角
$.lib 'models\ms018.lib' bjt_tt	//定义双极性晶体管工艺角
.end