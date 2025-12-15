clf
N=128;dt=1;
n=0:N-1;t=n*dt;%%时间序列
xn1=cos(0.14*pi*t);%原始信号
subplot(3,2,1),plot(t,xn1);title('原始信号');

xn2=cirshftt(xn1,20,N);
subplot(3,2,2),plot(t,xn2);
title('时移20个单位的信号')
Xk1=dfs(xn1,N);
magXk1=abs(Xk1);phaXk1=angle(Xk1);%%信号的振幅与相位

k=0:length(magXk1)-1;
subplot(3,2,3),
plot(k/(N*dt),magXk1*2/N);
ylabel('振幅')
title('原始信号的振幅谱');
subplot(3,2,4),plot(k/(N*dt),unwrap(phaXk1));
ylabel('相位角/rad')%%unwrap将信号解卷绕，即将相位角展开
title('原始信号的相位谱')

Xk2=dfs(xn2,N);
Xk2=Xk2./exp(-2*j*pi*k*20/N);
magXk2=abs(Xk2);phaXk2=angle(Xk2);

k=0:length(magXk2)-1;
subplot(3,2,5),
plot(k/(N*dt),magXk2*2/N);
ylabel('振幅'),xlabel('频率/Hz');
title('移位后与exp(-2*j*pi*k*20/N)相乘的振幅谱');
subplot(3,2,6),plot(k/(N*dt),unwrap(phaXk2));
ylabel('相位角/rad');
title('移位后与exp(-2*j*pi*k*20/N)相乘的相位谱');


















