clear
clc

k=[1,2,3,4,5];
N = 10e5; 
%degrees of freedom & Number of Samples

lineColors=['r','g','b','c','m','y','k']; %line color arguments
legendString =cell(1,5); %cell array of string for printing legend
figure;hold on;

for i = 1:length(k),
    Y=chiRV(k(i),N);
    [Q,X] = hist(Y,1000);%Histogram for each degree of freedom
    plot(X,Q/trapz(X,Q),lineColors(i));
    legendString{i}=strcat(' k=',num2str(i));
end

legend(legendString);
title('Central Chi Distributed RV - PDF','fontsize',12);
xlabel('Parameter - x');ylabel('f_X(x)');axis([0 4 0 1]);

%%cell(1,5) 的作用是创建一个1行5列的空元胞数组。
%%初始时每个元素都是空元胞 []。
%%预先分配存储空间
% legendString = cell(1,5);
% 
% % 在循环中填充
% for i=1:length(k),
%     ...
%     legendString{i} = strcat(' k=', num2str(i));
% end
% 预分配一个元胞数组来存储5个图例字符串，避免在循环中动态扩展数组（提高效率）。