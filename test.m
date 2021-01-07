%plot for test
y=loadsig('test.tr0');
char=lssig(y)
plotsig(y,'v_clk1;v_clk1d;v_clk2d;v_vin;v_out');
