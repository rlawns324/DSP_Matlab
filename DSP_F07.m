% Example 6.2
% Compute y(n) = 2x(n) - 4x(n-1) - 0.5y(n-1) - 0.5y(n-2)
%Nonzero initial conditions:
%y(-2)=1, y(-1)=0, x(-1)=-1, x(n)=(0.8)^n*u(n)
y = zeros(1,20); %Set up a vector to stroe y(n)
y = [1 0 y];
n = 0:1:19;
x = (0.8).^n;
x = [0 -1 x];
for n = 1:20
    y(n+2) = 2*x(n+2) - 4*x(n+1) - 0.5*y(n+1)-0.5*y(n); %Compute 20 outputs 
end
n = 0:1:19;
subplot(3,1,1); stem(n,x(3:22)); grid; ylabel('Input x(n)');
xlabel('Sample Number');
subplot(3,1,2); stem(n,y(3:22)), grid;
xlabel('Number of samples, n; part(a)');ylabel('Output y(n)');
y(3:22); %Output y(n)
y = zeros(1,20);
y = [0 0 y];
n = 0:1:19;
x = (0.8).^n;
x = [0 0 x];
for n = 1:20
    y(n+2) = 2*x(n+2) - 4*x(n+1) - 0.5*y(n+1)-0.5*y(n); %Compute 20 outputs 
end
n = 0:1:19;
subplot(3,1,3); stem(n,y(3:22)); grid; 
xlabel('Number of samples, n; part(b)');ylabel('Output y(n)');
y(3:22); %Output y(n)    