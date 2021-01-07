%plot for sub_ADC
y=loadsig('sub_ADC.sw0');
char=lssig(y)
for index=1:1:length(char(:,1))
	figure(index)
	plotsig(y,char(index,:));
end
