.title pre_amp

*****************************************************************************************
* Library Name: comparator
* Cell Name: pre_amp
* View Name: schematic
*****************************************************************************************

.SUBCKT pre_amp Idc_2u gnda vdda vin v1p voutn voutp
MMbias Idc_2u Idc_2u gnda gnda n18 W=4u L=2u m=1
MM0 net27 Idc_2u gnda gnda n18 W=8u L=2u m=1
MM1 voutn vip net27 gnda n18 W=4u L=2u m=1
MM2 voutp vin net27 gnda n18 W=4u L=2u m=1
MM3 voutn voutn vdda vdda p18 W=1.8u L=1u m=1
MM4 voutn voutp vdda vdda p18 W=1u L=1u m=1
MM5 voutp voutn vdda vdda p18 W=1u L=1u m=1
MM6 voutp voutp vdda vdda p18 W=1.8u L=1u m=1
.ENDS

x1 Idc_2u gnda vdda vin v1p voutn voutp pre_amp

c10 voutp 0 1p
c11 voutn 0 1p
IIdc_2u vdda Idc_2u 2u
vvdda vdda 0 1.8
vgnda gnda 0 0
vvin vin 0 0.9 ac 1 0
vvip v1p 0 0.9 ac 1 180

.tf v(voutn) win	//计算预放大器传输函数
.temp 27
.lib 'models\ms018.lib' tt
.noise v(voutp) vvip 10	//仿真预放大器噪声特性
.op
.ac dec 10 10 10g
.option post accurate probe
.probe vdb(voutp) vp(voutp)	//打印输入点的增益和相位曲线
.probe noise inoise onoise	//打印等效输入噪声和等效输出噪声
.measure powerall avg power	//计算预放大器平均功耗
.end
