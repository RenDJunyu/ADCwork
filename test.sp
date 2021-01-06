.title test
.include 'models/Bandgap.cdl'
.include 'models/misc.cdl'
.include 'models/OTA.cdl'

* 反向运放
x1 vip vin out vdd vss OPAMP
R1 vi vin 10k
R2 vin out 10k
R3 vip 0 10k

vvdd vdd 0 3.3
vvss vss 0 -3.3
vvin vi 0 a

.option post accurate probe
.op
.temp 27
.dc a -3.3 3.3 0.1
*.probe dc v(Vref)
.print dc v(out)

.lib 'models\ms018_v1p7.lib' tt
.lib 'models\ms018_v1p7.lib' res_tt
.lib 'models\ms018_v1p7.lib' mim_tt
.lib 'models\ms018_v1p7.lib' bjt_tt

.end