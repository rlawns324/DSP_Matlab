% Ex 4.8
close all; clear all;
%Generate the sine wave sequence
fs = 8000; %Sampling rate
N = 1000; %Number of data points
x = 2 * sin(2000 * pi*[0:1:N-1]/fs);
%Apply the DFD algorithm
figure(1);
xf= abs(fft(x))/N; %Compute the amplitude spectrum
P = xf.*xf; %Compute the power spectrum
f = [0:1:N-1]*fs/N;
subplot(2,1,1); plot(f,xf); grid;
xlabel('Frequency(Hz)'); ylabel('Amplitude spectrum(DFT)');
subplot(2,1,2); plot(f,P); grid;
xlabel('Frequency(Hz)'); ylabel('Power spectrum(DFT)');
figure(2);
%Convert it to one-sided spectrum
xf(2:N) = 2*xf(2:N); %Get the Single-sided spectrum
P = xf.*xf;
f = [0:1:N/2]*fs/N; %Frequencies up to the folding frequency
subplot(2,1,1); plot(f,xf(1:N/2+1)); grid;
xlabel('Frequency(Hz)'); ylabel('Amplitude spectrum(DFT)');
subplot(2,1,2); plot(f,P(1:N/2+1)); grid;
xlabel('Frequency(Hz)'); ylabel('Power spectrum(DFT)');
figure(3);
%Zero padding to the length of 1024
x = [x,zeros(1,24)];
N = length(x);
xf = abs(fft(x))/N;
P = xf.*xf;
f = [0:1:N-1]*fs/N;
subplot(2,1,1); plot(f,xf); grid;
xlabel('Frequency(Hz)'); ylabel('Amplitude spectrum(FFT)');
subplot(2,1,2); plot(f,P); grid;
xlabel('Frequency(Hz)'); ylabel('Power spectrum(FFT)');
figure(4);
%Convert it to one-sided spectrum
xf(2:N) = 2*xf(2:N);
P = xf.*xf;
f = [0:1:N/2]*fs/N;
P = xf.*xf;
f = [0:1:N/2]*fs/N;
subplot(2,1,1); plot(f,xf(1:N/2+1)); grid;
xlabel('Frequency(Hz)'); ylabel('Amplitude spectrum(FFT)');
subplot(2,1,2); plot(f,P(1:N/2+1)); grid;
xlabel('Frequency(Hz)'); ylabel('Power spectrum(FFT)');