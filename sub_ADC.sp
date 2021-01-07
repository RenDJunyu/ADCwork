.title sub_ADC
.inc 'models\misc.cdl'
.include 'models\Bandgap.cdl'
.include 'models\OTA.cdl'

vvdd1 vdd1 0 3.3
vvss1 vss1 0 -3.3
xr1 gnda vdd1 vss1 vref vIref Bandgapb $1.61V和-1.6V带隙基准电压源

* 分压电路
R1 pot1 vIref 300k
R2 pot2 pot1 200k
R3 pot3 pot2 200k
R4 pot4 pot3 200k
R5 pot5 pot4 200k
R6 pot6 pot5 200k
R7 pot7 pot6 300k
R8 vref pot7 5k

* 比较电路
xc1 Iin clk gnda1 out1 vdda pot1 vip comparator_preamp $-1.0V
xc2 Iin clk gnda1 out2 vdda pot2 vip comparator_preamp $-0.6V
xc3 Iin clk gnda1 out3 vdda pot3 vip comparator_preamp $-0.2V
xc4 Iin clk gnda1 out4 vdda pot4 vip comparator_preamp $0.2V
xc5 Iin clk gnda1 out5 vdda pot5 vip comparator_preamp $0.6V
xc6 Iin clk gnda1 out6 vdda pot6 vip comparator_preamp $1.0V

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

.param a=1.5
IIin vdda Iin 2u
vclk clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdda vdda 0 1.8
vvssa gnda1 0 -1.8
vgnda gnda 0 0
vvip vip 0 a pwl 10n -1.7,30u 1.7,50u -1.7,70u 1.7,90u -1.7,100u -1.7 
$vvip vip 0 a pwl 10n -1.7,5u -1.7,5.010u 1.7 

.temp 27
.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.op
.print op v(pot1) v(pot2) v(pot3) v(pot4) v(pot5) v(pot6)
.tran 0.1n 100u
.option post accurate probe nomod captab
.probe tr v(vip) v(clk) v(out1) v(out2) v(out3) v(out4) v(out5) v(out6) 
.probe tr v(vip) v(pot1) v(pot2) v(pot3) v(pot4) v(pot5) v(pot6) 
.measure powerall avg power
.end
