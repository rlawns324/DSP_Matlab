% Ex 4.11
close all; clear all;
%Generate the sine wave sequence
fs = 8000; T = 1/fs; %Sampling rate and sampling period
x = 2 * sin(2000*pi*[0:1:50]*T); %Generate the 51 2-kHz samples
%Apply the FFT algorithm
N = length(x);
index_t = [0:1:N-1];
f= [0:N-1]*8000/N; %Map the frequency bin to the frequency(Hz)
xf = abs(fft(x))/N; %Calculate the amplitutde spectrum
figure(1);
%Using the Bartlett window
x_b = x.*bartlett(N)'; %Apply the triangular window function
xf_b = abs(fft(x_b))/N; %Calculate the amplitude spectrum
subplot(2,2,1); plot(index_t,x); grid;
xlabel('Time index n'); ylabel('x(n)');
subplot(2,2,3); plot(index_t,x_b); grid;
xlabel('Time index n'); ylabel('Triangular windowed x(n)');
subplot(2,2,2); plot(f,xf); grid; axis([0 8000 0 1]);
xlabel('Frequency(Hz)'); ylabel('Ak(no window)');
subplot(2,2,4); plot(f,xf_b); grid; axis([0 8000 0 1]);
xlabel('Frequency(Hz)'); ylabel('Triangular windowed Ak');
figure(2);
%Generate the sine wave sequence
x = 2 * sin(2000 * pi * [0:1:100]*T);%Generate the 101 2-kHz samples
%Apply the FFT algorithm
N = length(x);
index_t = [0:1:N-1];
f= [0:N - 1] * fs/N; 
xf = abs(fft(x)) / N; 
%Using the Hamming window
x_hm = x.*hamming(N)'; %Apply the Hamming window function
xf_hm = abs(fft(x_hm))/N; %Calculate the amplitude spectrum
subplot(2,2,1); plot(index_t,x); grid;
xlabel('Time index n'); ylabel('x(n)');
subplot(2,2,3); plot(index_t,x_hm); grid;
xlabel('Time index n'); ylabel('Hamming windowed x(n)');
subplot(2,2,2); plot(f,xf); grid; axis([0 fs 0 1]);
xlabel('Frequency(Hz)'); ylabel('Ak(no window)');
subplot(2,2,4); plot(x,xf_hm); grid; axis([0 fs 0 1]);
xlabel('Frequency(Hz)'); ylabel('Hamming windowed Ak');
figure(3);
%Generate the sine wave sequence
x = 2 * sin(2000 * pi * [0:1:150]*T); %Generate the 151 2-kHz samples
%Apply the FFT algorithm
N = length(x);
index_t = [0:1:N-1];
f= [0:N - 1] * fs/N; 
xf = 2*abs(fft(x)) / N; xf(1) = xf(1)/2; %Single-sided spectrum
%Using the Hanning window
x_hn = x.*hanning(N)'; 
xf_hn = 2*abs(fft(x_hn))/N; xf_hn(1) = xf_hn(1)/2;  %Single-sided spectrum
subplot(2,2,1); plot(index_t,x); grid;
xlabel('Time index n'); ylabel('x(n)');
subplot(2,2,3); plot(index_t,x_hn); grid;
xlabel('Time index n'); ylabel('Hanning windowed x(n)');
subplot(2,2,2); plot(f(1:(N-1)/2),xf(1:(N-1)/2)); grid; axis([0 fs/2 0 1]);
xlabel('Frequency(Hz)'); ylabel('Ak(no window)');
subplot(2,2,4); plot(f(1:(N-1)/2),xf_hn(1:(N-1)/2)); grid; axis([0 fs/2 0 1]);
xlabel('Frequency(Hz)'); ylabel('Hanning windowed Ak');