%
close all; clear all; clc
fs = 8000; %Sampling rate
T = 1/fs; %Smapling period
v = sqrt(0.1)*randn(1,250); %Generate the Gaussian random noise
n = 0:1:249; %Indexes
x = sqrt(2)*sin(2*pi*500*n*T) + v;
subplot(2,1,1); plot(n,x);
xlabel('Number of samples'); ylabel('Sample value'); grid;
N = length(x);
f = [0:N/2]*fs/N;
Axk = 2*abs(fft(x)) / N; Axk(1) = Axk(1)/2; %Calculate the single-sided spectrum
subplot(2,1,2); plot(f,Axk(1:N/2+1));
xlabel('Frequency (Hz)'); ylabel('Amplitude|X(f)|'); grid;
figure
Wnc = 2*pi*900/fs; %Determine the normalized digital cutoff frequency
B = firwd(133,1,Wnc,0,4); %Design the FIR filter
y = filter(B,1,x);
Ayk = 2*abs(fft(y)) / N; Ayk(1) = Ayk(1)/2; %Single-sided spectrum of the filtered data
subplot(2,1,1); plot(n,y);
xlabel('Number of samples'); ylabel('Sample value'); grid;
subplot(2,1,2); plot(f,Ayk(1:N/2+1)); axis([0 fs/2 0 1.5]);
xlabel('Frequency(Hz)'); ylabel('Amplitude |Y(f)|'); grid;
