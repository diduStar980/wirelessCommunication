dt=0.01;
t=0:dt:4*pi;
y1=sin(t);
subplot(3,1,1),plot(t,y1);
title('原始信号');

% [0, y2] 的意思是：将数字 0 和向量 y2 水平拼接在一起，形成一个新的、列数更多的矩阵。
% 假设 y2 本身是一个有 n 个元素的向量（例如 y2 = [a, b, c]），
% 那么 [0, y2] 的结果就是一个有 n+1 个元素的向量（例如 [0, a, b, c]）
y2=diff(y1)/dt;%对信号进行微分
subplot(3,1,2),plot(t,[0,y2]);%%
title('微分后信号');

y3=cumtrapz(y2)*dt;
subplot(3,1,3),plot(t,[0,y3]);
title('积分后信号');

xlabel('时间/s')