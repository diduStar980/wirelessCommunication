x1=randn(1,100);
x2=randn(1,100);
subplot(1,2,1); plot(x1,x2,'r*');
title('Uncorrelated RVs X_1 and X_2');
xlabel('X_1'); ylabel('X_2');

rho=0.9;
z=rho*x1+sqrt(1-rho^2)*x2;
subplot(1,2,2); plot(x1,z,'r*');
title(['Correlated RVs X_1 and Z , \rho=',num2str(rho)]);
xlabel('X_1'); ylabel('Z');

%%num2str(rho) 的作用是将数值变量 rho 转换为字符串
% 为什么需要转换：
% MATLAB的 title() 函数接受字符串输入
% 不能直接将数值和字符串拼接：['text', 0.7] 会报错
% num2str 将数值转换为字符串后才能拼接
