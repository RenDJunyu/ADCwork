%plot for bandgap_vdd_sim
y=loadsig('bandgap_vdd_sim.sw0');
char=lssig(y)
for index=1:1:length(char(:,1))
	figure(index)
	plotsig(y,char(index,:));
end
