title('Sampling condition is satisfied');
xlabel('Time (sec)'); ylabel('Voltage');
t = linspace(0,0.1,10);
y1 = sin(t);
at1 = subplot(2,1,1);
plot(at1,t,y1)

y2 = sin(t * 2);
at2 = subplot(2,1,2);
plot(at2,t,y2)
axis([at1 at2],[0 0.1 -1 1])