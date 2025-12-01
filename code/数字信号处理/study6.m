n=[0:100];
x=2*sin(0.02*pi*n+pi/4);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('正弦序列');
grid on;