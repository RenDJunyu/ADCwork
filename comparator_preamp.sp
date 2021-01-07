.title comparator_preamp
.inc 'models/misc.cdl'
.inc 'models/OTA.cdl'
.inc 'models/Bandgap.cdl'
.inc 'models/comparator.cdl'

x1 Iin clk vss out vdd vin vip comparator_preamp
Iin vdd Iin 2u
vclk clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 500n 1u)
vvdda vdd 0 1.8
vgnda vss 0 -1.8
*vvip vip 0 pwl 10n 0.8988, 10u 0.8988, 20u 0.9012,30u 0.899, 40u 0.901, 50u 0.8993
vvip vip 0 pwl 10n -1.7,30u 1.7,50u -1.7,70u 1.7,90u -1.7,100u -1.7 
vvin vin 0 0

* C1 out 0 10p

.temp 27
.lib 'models\ms018_v1p7.lib' ff
.lib 'models\ms018_v1p7.lib' res_ff
.lib 'models\ms018_v1p7.lib' mim_ff
.lib 'models\ms018_v1p7.lib' bjt_ff
.op
.tran 0.1n 50u
.option post accurate probe nomod captab
.probe v(vip) v(vin) v(clk) v(out)
.measure powerall avg power
.end
