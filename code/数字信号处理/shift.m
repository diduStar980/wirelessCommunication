% length( )返回数组（向量或矩阵）中最大维度的长度。
% 对于像 x 这样的向量来说，length(x) 直接返回向量中元素的个数。 

t=0:0.001:1;
fo=2;
f1=10;
x=chirp(t,fo,1,f1);
m=1:length(x);
subplot(2,1,1),plot((m-1)*0.001,x);
xlim([0 1.5]),title('原始信号');
[y,n]=sigshift(x,m,500);

subplot(2,1,2),plot((n-1)*0.001,y);%%
xlim([0 1.5]),title('时移后信号');xlabel('时间/s')
