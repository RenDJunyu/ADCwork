%plot for SHsim
y=loadsig('SHsim.tr0');
char=lssig(y)
plotsig(y,'v_vin;v_shout;v_out');
