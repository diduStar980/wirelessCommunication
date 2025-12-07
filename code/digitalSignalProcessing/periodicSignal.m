x=randn(1,20);
xp=[x x x x x];
subplot(2,1,1),plot(x),title('原始信号');
subplot(2,1,2),plot(xp),title('周期信号');
xlabel('n');