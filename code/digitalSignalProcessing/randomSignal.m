n=1:10;
x=rand(1,10);
subplot(2,1,1),stem(n,x);
xlabel('n');
ylabel('x1(n)');
title('rand产生的随机序列');
grid on;
x=randn(1,10);
subplot(2,1,2),stem(n,x);
hold on;
plot(n,zeros(1,10));%%绘制横轴,zeros(1,10)创建一个包含10个元素的行向量，且所有元素的值都为0。
xlabel('n');
ylabel('x2(n)');
ylim([-4 4]);
title('randn产生的随机序列');
grid on;