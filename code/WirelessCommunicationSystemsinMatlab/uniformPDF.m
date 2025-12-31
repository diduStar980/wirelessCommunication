a=2;b=10; %open interval (2,10)
X=a+(b-a)*rand(1,1000000);%simulate uniform RV
[p,edges]=histcounts(X,'Normalization','pdf');%estimated PDF
%%histcounts 函数是 MATLAB 中用于计算直方图统计信息但不绘制图形的函数
% 输入：数据向量 X
% 输出：
% p：每个区间的概率密度值
% edges：区间的边界值

outcomes = 0.5*(edges(1:end-1) + edges(2:end));%possible outcomes
% %%计算每个直方图区间的中心点坐标
% 作为x轴的显示位置

g=1/(b-a)*ones(1,length(outcomes)); %Theoretical PDF
bar(outcomes,p);hold on;plot(outcomes,g,'r-');

% bar(outcomes,p)：用条形图显示模拟数据的直方图
% plot(outcomes,g,'r-')：用红色直线绘制理论均匀分布
title('Probability Density Function');legend('simulated','theory');
xlabel('Possible outcomes');ylabel('Probability of outcomes');