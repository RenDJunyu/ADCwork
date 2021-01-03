.title comparator_preamp
*****************************************************************************************
* Library Name: comparator
* Cell Name: INV
* View Name: schematic
*****************************************************************************************

.SUBCKT INV gnda in out vdda	//建立反相器电路
MPM2 out in vdda vdda p18 W=4u L=180n m=1
MNM1 out in gnda gnda n18 W=2u L=180n m=1
.ENDS

*****************************************************************************************
* Library Name: comparator
* Cell Name: NAND
* View Name: schematic
*****************************************************************************************
.SUBCKT NAND A B gnda out vdda	//建立与非门电路
MPM2 out A vdda vdda p18 W=4u L=180n m=1
MPM1 out B vdda vdda p18 W=4u L=180n m=1
MNM1 net52 B gnda gnda n18 W=2u L=180n m=1
MNM2 out A net52 gnda n18 W=2u L=180n m=1
.ENDS

*****************************************************************************************
* Library Name: comparator
* Cell Name: comparator
* View Name: schematic
*****************************************************************************************

.SUBCKT comparator clk gnda out vdda vin vip	//建立动态比较器电路
XI2 gnda net048 net045 vdda / INV
XI3 gnda net045 out vdda / INV
XI0 outpl net048 gnda net049 vdda / NAND
XI1 net049 outnl gnda net048 vdda / NAND
MM9 outpl outnl vdda vdda p18 W=60u L=180n m=1
MM10 outpl clk vdda vdda p18 W=60u L=180n m^l
MM8 outnl outpl vdda vdda p18 W=60u L=180n m=1
MM7 outnl clk vdda vdda p18 W=60u L=180n m=1
MM4 net40 vin gnda gnda n18 W=20u L=180n m=1
MM3 net40 net42 gnda gnda n18 W=20u L=180n m=1
MM6 outpl clk net40 gnda n18 W=30u L=180n m=1
MM5 outnl clk net42 gnda n18 W=30u L=180n m=1
MM2 net42 net40 gnda gnda n18 W=20u L=180n m=1
MM1 net42 v1p gnda gnda n18 W=20u L=180n m=1
.ENDS

*****************************************************************************************
* Library Name: comparator
* Cell Name: pre_amp
* View Name: schematic
*****************************************************************************************

.SUBCKT pre_amp Idc_2u gnda vdda vin v1p voutn voutp //建立预放大器电路
MM4 voutn voutp vdda vdda p18 W=1u L=1u m=1
MM5 voutp voutn vdda vdda p18 W=1u L=1u m=1
MM6 voutp voutp vdda vdda p18 W=1.8u L=1u m=1
MM3 voutn voutn vdda vdda p18 W=1.8u L=1u m=1
MM1 voutn vip net27 gnda n18 W=4u L=2u m=1
MM2 voutp vin net27 gnda n18 W=4u L=2u m=1
MM0 net27 Idc_2u gnda gnda n18 W=8u L=2u m=1
MMbias Idc_2u Idc_2u gnda gnda n18 W=4u L=2u m=1
.ENDS

*****************************************************************************************
* Library Name: comparator
* Cell Name: comparator_preamp
* View Name: schematic
*****************************************************************************************

.SUBCKT comparator_preamp Iin clk gnda out vdda vin vip
XI43 clk gnda out vdda net34 net33 / comparator
XI42 Iin gnda vdda vin v1p net34 net33 / pre_amp
.ENDS

x1 Iin clk gnda out vdda vin v1p comparator_preamp
Iin vdda Iin 2u
vclk clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdda vdda 0 1.8
vgnda gnda 0 0
vvip v1p 0 pw1 10n 0.8988, 10u 0.8988, 20u 0.9012,30u 0.899, 40u 0,901, 50u 0.8993
vvin vin 0 0.9

.temp 27
.lib
.lib 'models\ms018.lib' tt
.op
.tran 0.1n 50u
.option post accurate probe nomod captab
.probe v(vip) v(vin) v(clk) v(out)
.measure powerall avg power
.end
