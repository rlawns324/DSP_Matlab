% Problem 6.19.
% Given a filter
% H(z) = (1+ 2z^-1 + z^-2) / (1+ 0.5z^-1 + 0.25z^-2)

% 1. its magnitude frequency response.
% 2. its phase response.
b = [1 2 1];
a = [1 -0.5 0.25];
freqz(b,a);

% Problem 6.21.
% H(z) = (1 -1z^-1 + z^-2) / (1 - 0.9z^-1 + 0.81z^-2)
% a. plot the magnitude frequency response and phase response using MATLAB
b = [1 -1 1];
a = [1 -0.9 0.81];
freqz(b,a);

% b. specify the type of filtering
% This filter is IIR filter because there are feedbacks

% c. find the difference equation
% y(n) = x(n) - x(n-1) + x(n-2) + 0.9y(n-1) - 0.81y(n-2)


% d. perform filtering, that is, calculate y(n) for the first 1,000 samples
% for each of the following inputs and plot the filter outputs using
% MATLAB, assuming that all initial conditions are zeros and the
% sampling rate is 8,000 Hz: 
% 1. x(n)=cos(pi * 1000 * n/8000)
% 1. x(n)=cos(8/3 * pi * 1000 * n/8000)
% 1. x(n)=cos(6 * pi * 1000 * n/8000)
y = zeros(1,1000); %Set up a vector to store y(n)
y = [0 0 y];
n = 0:1:999;
x1 = cos(pi * 1000 * n/8000); 
x2 = cos(8/3 * pi * 1000 * n/8000);
x3 = cos(6 * pi * 1000 * n/8000);
x1 = [0 0 x1];
x2 = [0 0 x2];
x3 = [0 0 x3];
for n = 1:1000
    y(n+2) = x1(n+2) - x1(n+1) + x1(n) + 0.9*y(n+1) - 0.81*y(n); %Compute 1000 outputs 
end
n = 0:1:999;
subplot(3,1,1);  plot(n,y(3:1002));

y = zeros(1,1000); %Set up a vector to store y(n)
y = [0 0 y];
for n = 1:1000
    y(n+2) = x2(n+2) - x2(n+1) + x2(n) + 0.9*y(n+1) - 0.81*y(n); %Compute 1000 outputs 
end
n = 0:1:999;
subplot(3,1,2);  plot(n,y(3:1002));

y = zeros(1,1000); %Set up a vector to store y(n)
y = [0 0 y];
for n = 1:1000
    y(n+2) = x3(n+2) - x3(n+1) + x3(n) + 0.9*y(n+1) - 0.81*y(n); %Compute 1000 outputs 
end
n = 0:1:999;
subplot(3,1,3);  plot(n,y(3:1002));

% e. repeat (d) using the MATLAB function filter().
b=[1 -1 1];
a=[1 -0.9 0.81];
n=0:1:999;
fs=8000;
x1=cos(pi*10^3*n/fs);
x2=cos(8/3*pi*10^3*n/fs);
x3=cos(6*pi*10^3*n/fs);
y1=filter(b,a,x1);
y2=filter(b,a,x2);
y3=filter(b,a,x3);
subplot(3,1,1); plot(n,y1);
subplot(3,1,2); plot(n,y2);
subplot(3,1,3); plot(n,y3);
x1=cos(pi*1000*n/8000);
y1=filter(b,a,x1);
subplot(3,1,1); plot(n,y1);
hold on
x1=cos(pi*10^3*n/fs);
y1=filter(b,a,x1);
subplot(3,1,1); plot(n,y1);

%HW04 Practice filter(), filtic()
% Compute y = 2x(n)- 4x(n-1) -0.5y(n-1) -0.5y(n-2) 
b=[2 -4];
a=[1 0.5 0.5];
n=0:1:79;
x=(0.8).^n;
y1=filter(b,a,x);
Yi=[0 1];
Xi=[-1 0];
Zi1=filtic(b,a,Yi,Xi);
y2=filter(b,a,x,Zi1);
subplot(2,1,1); plot(n,y1);
subplot(2,1,2); plot(n,y2);

%Compute  y = 2x(n)- 4x(n-1) -0.5y(n-1) -y(n-2) 
a2=[1 0.5 1];
y3=filter(b,a2,x);
Zi2=filtic(b,a2,Yi,Xi);
y4=filter(b,a2,x,Zi2);
figure;
subplot(2,1,1); plot(n,y3);
subplot(2,1,2); plot(n,y4);