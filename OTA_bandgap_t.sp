.title OTA of bandgap ac simulation program
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'
.include 'models/SHmodel.cdl'
.include 'models/comparator.cdl'
.include 'models/subADAC.cdl'

$x1 Idc_10u gnda out vdda vin vip OTA_bandgap
xr1 0 vddh vssh vref vIref / Bandgapb

vvddh vddh 0 3.3
vvssh vssh 0 -3.3
$v1 vdda 0 3.3	$电源电压3.3V
v2 gnda 0 0	$地电压0V
v3 vip 0 0.73 ac 1 0	$正输入端，共模电压0.73V,交流电压1V，相位0度
v4 vin 0 0.73 ac 1 180	$负输入端，共模电压0.73V,交流电压1V，相位180度
i1 Idc_10u gnda 3u	$电流源3uA
c1 out 0 0.2p	$输出等效负载电容
.option post accurate probe	$仿真选项设置
.op	$静态工作点分析语句
.temp 27	$仿真温度设置
.tran 0.1n 100u
.probe v(vref) v(vIref) v(vddh)
.lib 'models\ms018_v1p7.lib' tt 	$定义MOS管工艺角 
.lib 'models\ms018_v1p7.lib' res_tt	$定义电阻工艺角
.lib 'models\ms018_v1p7.lib' mim_tt	$定义MIM电容工艺角
.lib 'models\ms018_v1p7.lib' BJT_TT	$定义双极性晶体管工艺角
.end