%% read mp3 file
[out fs] = audioread('speech.mp3');
N = 50000;    % data cut
data = out(1:N,1);
sound(data/max(abs(data)),fs);  % play
figure(1);plot(data);
title('original sound data');

%% Spectrum (one-sided)
N=length(data);
f=[0:N/2]*fs/N;
Axk=2*abs(fft(data))/N;Axk(1)=Axk(1)/2;
figure(2);
plot(f,Axk(1:N/2+1));grid
title('frequency response of original data');
R =500;
alpha = 0.5;
fs = 8000;
figure(3);
y = filter(1,[1 zeros(1, R-1) alpha], data);
freqz(1,[1 zeros(1,R-1) alpha], fs, fs);
subplot(4,1,1); plot(y); ylabel('alpha = 0.5'); xlabel('R = 500(62.5ms)');
pause;
sound(y/max(abs(y)), fs);
%% Filtering 
% 1. lowpass (Ex 7.8)




% 2. highpass (Ex 7.9)





% 3. bandpass (Ex 7.10)




%% Echo
% Prob 6.32 

% FIR


% IIR



