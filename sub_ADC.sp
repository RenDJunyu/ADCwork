.title sub_ADC
.inc 'models/misc.cdl'
.inc 'models/Bandgap.cdl'
.inc 'models/OTA.cdl'
.inc 'models/comparator.cdl'

$1.61V和-1.6V带隙基准电压源
xr1 gnda vddh vssh vref vIref Bandgapb 

* 分压电路
R1 pot1 vIref 300k
R2 pot2 pot1 200k
R3 pot3 pot2 200k
R4 pot4 pot3 200k
R5 pot5 pot4 200k
R6 pot6 pot5 200k
R7 vref pot6 300k
*R8 vref pot7 5k

* 比较电路
xc1 Iin clk vssl out1 vddl pot1 vip comparator_preamp $-1.0V
xc2 Iin clk vssl out2 vddl pot2 vip comparator_preamp $-0.6V
xc3 Iin clk vssl out3 vddl pot3 vip comparator_preamp $-0.2V
xc4 Iin clk vssl out4 vddl pot4 vip comparator_preamp $0.2V
xc5 Iin clk vssl out5 vddl pot5 vip comparator_preamp $0.6V
xc6 Iin clk vssl out6 vddl pot6 vip comparator_preamp $1.0V

$ 滤波电路
c11 pot1 0 10u
c12 pot2 0 10u
c13 pot3 0 10u
c14 pot4 0 10u
c15 pot5 0 10u
c16 pot6 0 10u

c21 out1 0 10p
c22 out2 0 10p
c23 out3 0 10p
c24 out4 0 10p
c25 out5 0 10p
c26 out6 0 10p

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
