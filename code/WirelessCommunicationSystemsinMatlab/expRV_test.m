lambda = 1.5;
L=100000;
T=expRV(lambda,L);

t_range = 0:0.2:5;
T_pdf=lambda*exp(-lambda*t_range);
histogram(T,'Normalization','pdf');
plot(t_range,T_pdf,'r');
xlabel('t');ylabel('pdf - f_T(t)');
title(['Exponential PDF - \lambda=',num2str(lambda)]);