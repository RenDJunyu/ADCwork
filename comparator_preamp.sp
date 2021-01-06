.title comparator_preamp
.inc 'models/misc.cdl'

*****************************************************************************************
* Library Name: comparator
* Cell Name: comparator_preamp
* View Name: schematic
*****************************************************************************************

.SUBCKT comparator_preamp Iin clk gnda out vdda vin vip
XI43 clk gnda out vdda net34 net33 / comparatormove
XI42 Iin gnda vdda vin vip net34 net33 / pre_amp
.ENDS

x1 Iin clk gnda out vdda vin vip comparator_preamp
Iin vdda Iin 2u
vclk clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdda vdda 0 1.8
vgnda gnda 0 0
vvip vip 0 pwl 10n 0.8988, 10u 0.8988, 20u 0.9012,30u 0.899, 40u 0.901, 50u 0.8993
vvin vin 0 0.9

.temp 27
.lib 'models\ms018.lib' tt
.op
.tran 0.1n 50u
.option post accurate probe nomod captab
.probe v(vip) v(vin) v(clk) v(out)
.measure powerall avg power
.end
