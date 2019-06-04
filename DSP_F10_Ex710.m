%Figure 7.18(Example 7.10)
%MATLAB program to create Figure 7.18
%
N = 25; Ftype = 3; WnL = 0.2625*pi; WnH=0.725*pi; Wtype=4; fs=8000;
Bham=firwd(N,Ftype,WnL,WnH,Wtype);
freqz(Bham,1,512,fs);
axis([0 fs/2 -130 10]);