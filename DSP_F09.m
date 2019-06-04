%Example 7.3 - b
%MATLAB program to plot frequency responses
%
[hz, w] = freqz([-0.09355 -0.01558 0.1 -0.01558 -0.09355], [1], 512);
phi = 180*unwrap(angle(hz))/pi;
subplot(2,1,1),plot(w,20*log10(abs(hz))),grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)');
subplot(2,1,2),plot(w,phi),grid;
xlabel('Frequency (radians)');
ylabel('Phase (degrees)');
