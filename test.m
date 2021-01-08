%plot for sub_ADC
y=loadsig('test.tr0');
char=lssig(y)
figure(1)
plotsig(y,'v_clk1;v_clk1d;v_clk2d;v_vin;v_shout;v_out');
figure(2)
plotsig(y,'v_out1;v_out2;v_out3;v_out4;v_out5;v_out6');
figure(3)
plotsig(y,'v_xsubdac_ina;v_xsubdac_inb;v_xsubdac_inc;v_xsubdac_ind;v_xsubdac_ine;v_xsubdac_inf');