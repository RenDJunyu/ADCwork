.title sub_ADC
.inc 'models\misc.cdl'
.include 'models\Bandgap.cdl'
*****************************************************************************************
* Library Name: comparator
* Cell Name: comparator_preamp
* View Name: schematic
*****************************************************************************************

.SUBCKT comparator_preamp Iin clk gnda out vdda vin vip
XI43 clk gnda out vdda net34 net33 / comparatormove
XI42 Iin gnda vdda vin vip net34 net33 / pre_amp
.ENDS

xr1 gnda vddar1 vref Bandgapa
v1 vddar1 0 3.3

R1 pot1 0 400k
R2 pot2 pot1 400k
R3 pot3 pot2 400k
R4 pot4 pot3 400k
R5 vref pot4 10k

xc1 Iin clk gnda out1 vdda pot1 vip comparator_preamp
xc2 Iin clk gnda out2 vdda pot2 vip comparator_preamp
xc3 Iin clk gnda out3 vdda pot3 vip comparator_preamp
xc4 Iin clk gnda out4 vdda pot4 vip comparator_preamp
Iin vdda Iin 2u
vclk clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdda vdda 0 1.8
vgnda gnda 0 0
vvip vip 0 pwl 10n 0, 10u 0, 50u 1.61,90u 0, 100u 0

.temp 27
.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.op
.tran 0.1n 100u
.option post accurate probe nomod captab
.probe v(vip) v(clk) v(out1) v(out2) v(out3) v(out4) 
.measure powerall avg power
.end
