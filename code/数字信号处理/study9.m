n0=0;
n1=-10;
n2=10;
n=[n1:n2];
x=[(n-n0)==0];%%只有(n-n0)=0时，x的值才为1，否则为0
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('脉冲序列');
grid on;