%
% 16bit pipeline ADC
%
clear;

fs=1;
ts=1/fs;

fin_pre=0.1;
nfft=2048;
fin=antismear(fin_pre,fs,nfft)

bits_number = 16;

open_system('pipeline_16bit')

sim('pipeline_16bit', 5000*ts);	% Starts Simulink simulation
stairs(simout)
hold
plot(simout1)