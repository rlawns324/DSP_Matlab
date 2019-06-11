x = audioread('speech.mp3');
figure(1);
fs = 8000;
alpha1 = 0.5;
R1 = 500;
y = filter(1,[1 zeros(1, R1-1) alpha1], x);
subplot(4,1,1); plot(y); ylabel('Echo'); xlabel('a=0.5, R=500');

alpha2 = 0.7;
R2 = 1000;
y = filter(1,[1 zeros(1, R2-1) alpha2], x);
subplot(4,1,2); plot(y); ylabel('Echo'); xlabel('a=0.7, R=1000');

alpha3 = 0.5;
R3 = 2000;
y = filter(1,[1 zeros(1, R3-1) alpha3], x);
subplot(4,1,3); plot(y); ylabel('Echo'); xlabel('a=0.5, R=2000');

alpha4 = 0.5;
R4 = 4000;
y = filter(1,[1 zeros(1, R4-1) alpha4], x);
subplot(4,1,4); plot(y); ylabel('Echo'); xlabel('a=0.5, R=4000');

