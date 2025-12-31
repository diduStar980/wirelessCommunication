clear all; close all; clc;

mu=0;sigma=1;
L=100000;
R=random('Normal',mu,sigma,L,1);%method 1

figure;
histogram(R,'Normalization','pdf');

X=-4:0.1:4;
fx_theory=pdf('Normal',X,mu,sigma);
hold on;
plot(X,fx_theory,'r');
title('PDF'); xlabel('values-x');
ylabel('pdf-f(x)');
axis tight;
legend('simulated','theory');