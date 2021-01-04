PATH := D:\HSPICE\hspice\BIN
CFLAG := -o
TARGET := bandgap_temp_sim

$(TARGET):
	$(PATH)\hspice $(TARGET).sp $(CFLAG)
	echo %%plot for $(TARGET)>$(TARGET).m
	echo y=loadsig('$(TARGET).sw0');>>$(TARGET).m
	echo char=lssig(y)>>$(TARGET).m
	echo for index=1:1:length(char(:,1))>>$(TARGET).m
	echo 	figure(index)>>$(TARGET).m
	echo 	plotsig(y,char(index,:));>>$(TARGET).m
	echo end>>$(TARGET).m

awaves:
	$(PATH)\awaves $(TARGET)

clean:
	del $(TARGET).ic0 $(TARGET).ma0 $(TARGET).pa0 $(TARGET).mt0

aclean:
	make clean
	del $(TARGET).lis $(TARGET).st0 $(TARGET).sw0 $(TARGET).ac0 $(TARGET).tr0 $(TARGET).m

ACP:
	git add .
	git commit -a -m 'full'
	git push orgin master