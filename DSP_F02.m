x = linspace(0,0.05,501);
f = 50;
y1 = cos(2*pi*f*x);
y2 = 2*sin(4*pi*f*x);
y3 = y1 + y2;

%System g(x) = x^2 - 3
g = x.^2 -3;
g1 = y1.^2-3;
g2 = y2.^2-3;
g3 = (y1+y2).^2-3;
g4 = g1 + g2;
subplot(2,1,1)
plot(x,g1);
hold on;
plot(x,g2);
plot(x,g3);
plot(x,g4,'k-.','LineWidth',0.5);
legend('g(y1(x))','g(y2(x))','g((y1+y2)(x))','g(y1(x))+g(y2(x))');
title('Linearity test(system g and h))');

%System h(x) = 3x
subplot(2,1,2);
h1=3*y1;
h2=3*y2;
h3 = 3*(y1 + y2);
h4 = h1 + h2;
plot(x,h1);
hold on;
plot(x,h2);
plot(x,h3);
plot(x,h4,'k-.','LineWidth',0.5);
legend('h(y1(x))','h(y2(x))','h((y1+y2)(x))','h(y1(x))+h(y2(x))');