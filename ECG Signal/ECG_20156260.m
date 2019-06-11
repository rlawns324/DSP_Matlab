% Application of filter to given ECG data
close all; clear all; clc;
fs = 500; %Sampling rate of ECG signal : 500Hz
freqz([1 -1.4579 1],[1 -1.3850 0.9025],1000,fs); %Notch filter
axis([0 fs/2 -60 1]);
figure(2);
load('ecg_noise.mat'); %load ecg_noise.mat;
x = ecg;
t = [0:length(x)-1]/500;
hz = 60;
x = x+500*cos(2*pi*hz*t);
y = filter([1 -1.4579 1],[1 -1.3850 0.9025],x);%Apply the Notch filter to the given ECG signal
%y = filter([1 -1.4579 1],[1 -1.3850 0.9025],x);
subplot(2,1,1); plot(x,'b'); grid;
ylabel('Original Samples');
title('ECG Data with noise');
subplot(2,1,2); plot(y,'m'); grid;
xlabel('Number of Samples'); ylabel('Filtered Samples');
title('Enhanced ECG signal.');
figure(3); 
%Detect the heart rate in Frequency domain.
N = length(x);
Axk = abs(fft(x.*hanning(N)'))/N;
Ayk = abs(fft(y.*hanning(N)'))/N;
f = [0:N/2]*fs/N;
Axk(2:N) = 2*Axk(2:N); Ayk(2:N)=2*Ayk(2:N);
subplot(2,1,1); plot(f,Axk(1:N/2+1),'b'); grid;
ylabel('Amplitude spectrum Ak');
title('ECG Data with noise in frequency domain');
subplot(2,1,2); plot(f,Ayk(1:N/2+1),'m'); grid;
ylabel('Amplitude spectrum Ak'); xlabel('Frequency (Hz)');
title('Enhanced ECG signal');


