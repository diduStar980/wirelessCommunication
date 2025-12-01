%% N=200;
dt=0.02;
f1=3;
f2=3;
%% n=0:N-1;
t=0:dt:4;
x1=0.5*sin(2*pi*f1*t+1);
x2=0.3*sin(2*pi*f2*t+2.2);
subplot(3,1,1),plot(t,x1);
ylim([-1 1]);%ylim的作用是设定图的y坐标轴的范围
title('第一个振动')
subplot(3,1,2),plot(t,x2);
ylim([-1 1]);
title('第二个振动')
subplot(3,1,3),plot(t,x1+x2);
ylim([-1 1]);
title('合成振动')                                                                                                                             
xlabel('时间/s')





