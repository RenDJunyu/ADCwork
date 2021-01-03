************************************************
* 　　　　模拟电路基础：                        
* 　　　　　　从系统级到电路级                  
************************************************
* 　　　　陈抗生　周金芳                        
************************************************
* 　　　　科学出版社　2020                      
************************************************          
*
.title test_clk

.include 'models\misc.cdl'

******************************************************
*  Parameters
******************************************************
* of Clocking
.param fs=1.024e6, ts=1/fs

* we need at least 8192 data points for FFT
.param tsn=5/fs *9000/fs
.param tstep=ts

******************************************************
*  Power supply
******************************************************
v1 vdda 0 1.8  
v2 gnda 0 0

******************************************************
*  Clocking generation
******************************************************
* INPUT : clkin
* OUTPUT: clk1, clk1d
*         clk2, clk2d
******************************************************
.param ts2=ts/2
x0 vdda gnda  clkin clk1 clk1d clk2 clk2d / CLOCKb
vclk clkin 0 pulse(0 1.8 1n 1n 1n ts2 ts)

******************************************************
*  RESET
******************************************************
* INPUT : RESET
******************************************************
* .param t1=5/fs
* .param t2=t1+tstep
* v7 reset 0 pwl(0 1.8 t1 1.8 t2 0 tsn 0)
* xsr1a vdda gnda reset s1p vcm1 / SWITCHb
* xsr1b vdda gnda reset s1n vcm1 / SWITCHb
* xsr1c vdda gnda reset x1p x1n  / SWITCHb

*.op
.tran tstep tsn
.probe v(clkin) v(clk1) v(clk1d) v(clk2) v(clk2d)

.temp 27
.option post accurate probe
.lib 'models\ms018.lib' tt

.end