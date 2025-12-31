clear;
clc;
k=[1,2,3,4,5];N=10e5;

lineColors=['r','g','b','k','m']; %line color arguments
legendString = cell(1,5);

for i=1:length(k),
    Y=chisquaredRV(k(i),N);
    [Q,X]=hist(Y,1000);
    plot(X,Q/trapz(X,Q),lineColors(i));
    hold on;
    legendString{i}=strcat(' k=',num2str(i));
end
legend(legendString);xlabel('Parameter - x');ylabel('f_X(x)');
title('Central Chi Squared RV - PDF');axis([0 8 0 0.5]);
%% trapz(X,Q) 的作用是使用梯形法则数值积分计算直方图条形的总面积。
%% Q = hist(Y, 1000);        % Q: 每个bin的频数计数
%% plot(X, Q/trapz(X,Q), ... % 将频数除以总面积，归一化为概率密度