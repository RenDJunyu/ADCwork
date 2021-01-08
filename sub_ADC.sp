.title sub_ADC
.inc 'models/misc.cdl'
.inc 'models/Bandgap.cdl'
.inc 'models/OTA.cdl'
.inc 'models/comparator.cdl'
.inc 'models/subADAC.cdl'

$1.61V和-1.6V带隙基准电压源
xr1 gnda vddh vssh vref vIref Bandgapb 
xsubADC vref vIref clk vddl vssl vip out1 out2 out3 out4 out5 out6 / subADC

$ Encoder

x2n vddl vssl out2 l2n / INV
x4n vddl vssl out4 l4n / INV
x6n vddl vssl out6 l6n / INV
x12 vddl vssl out1 l2n l12 / AND
x24 vddl vssl out2 l4n l24 / AND
x34 vddl vssl out3 l4n l34 / AND
x56 vddl vssl out5 l6n l56 / AND
xor11 vddl vssl l12 l34 l1234 / OR
xor12 vddl vssl l1234 l56 cd0 / OR
xor2 vddl vssl l24 out6 cd1 / OR

vvddh vddh 0 3.3
vvssh vssh 0 -3.3
vvddl vddl 0 1.8
vvssl vssl 0 -1.8
vgnda gnda 0 0
IIin vddl Iin 2u
vclk clk 0 pulse(-1.8 1.8 0.1n 0.1n 0.1n 500n 1u)

.param a=1.5

vvip vip 0 a pwl 10n -1.7,20u 1.7,40u -1.7 
$vvip vip 0 a pwl 10n -1.7,5u -1.7,5.010u 1.7 

.temp 27
.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.op
.print op v(vref) v(vIref) v(pot1) v(pot2) v(pot3) v(pot4) v(pot5) v(pot6) v(pot7)
.tran 0.1n 55u
.option post accurate probe nomod captab
.probe tr v(vip) v(clk) v(cd0) v(cd1) v(out4)
.probe tr v(vip) v(clk) v(out1) v(out2) v(out3) v(out5) v(out6)
.measure powerall avg power
.end
