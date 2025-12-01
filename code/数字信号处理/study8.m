n1=0;
n2=1;
n=[n1:0.1:n2];
x=n;
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('斜坡序列');
grid on;