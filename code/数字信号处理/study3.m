N=[-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10];
X=[0 1 2 3 2 1 0 -1 -2 -3 -4 -5 1 2];
subplot(2,1,1),stem(N,X);
limX=xlim; %这是最基本的赋值操作。它将等号右边表达式的结果（即 xlim 函数返回的向量）存储到等号左边的变量 limX 中
xlabel('序列号');
ylabel('序列值');
title('stem示例');
dt=1;t=N*dt;
subplot(2,1,2),plot(t,X);
hold on;
plot(limX,zeros(1,2),'k') %% zeros(1,2)->创建一个 1 行 2 列 的矩阵（也就是一个行向量），并且将这个矩阵中的所有元素都初始化为 0。
xlabel('time/s');
ylabel('values');
title('case1');