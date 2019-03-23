%Set Variables
Fs = 1000; dt = 1 / Fs; freq1 = 40; freq2 = 90; freq3 = 10;
%Graph 1
%Non sampled sine wave with 40Hz
t1 = 0:dt:1; x1 = sin(2* pi * freq1 * t1); 
%Sampled(0.01 steps) sine wave
s_t = 0:0.01:1; s_x1 = sin(2 * pi * freq1 * s_t); 
%Draw waves
subplot(2,1,1); plot(t1,x1); hold on; plot(s_t,s_x1,'ro'); yticks(-1:1:1); axis([0,0.1,-1.3,1.3]);
%User Informations (Text, gridLineStyle)
ylabel('Voltage'), xlabel('Time (sec)'), title('Sampling condition is satisfied'), grid on, set(gca,'GridLineStyle','--');

% Graph 2
%Non sampled sine wave with 90Hz
x2 = sin(2* pi * freq2 * t1); 
%Non sampled sine wave with 10Hz
x3 = -sin(2 * pi * freq3 * t1); 
%Sampled(0.01 steps) sine wave(Not Satisfied)
s_x3 = -sin(2 * pi * freq3 * s_t); 
subplot(2,1,2); plot(t1,x2); hold on; plot(t1,x3,'b--'); hold on; plot(s_t,s_x3,'ro'); yticks(-1:1:1); axis([0,0.1,-1.3,1.3]);
ylabel('Voltage'), xlabel('Time (sec)'), title('Sampling condition is not satisfied'), yticks(-1:1:1), axis([0,0.1,-1.3,1.3]),grid on, set(gca,'GridLineStyle','--');
