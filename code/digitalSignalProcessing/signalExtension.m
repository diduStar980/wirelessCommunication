n=-100:100;
dt=0.1;
t=n*dt;
y=sin(t);
y1=sin(2*t);
y2=sin(0.5*t);
subplot(3,1,1),plot(n,y1);title('压缩信号');
subplot(3,1,2),plot(n,y);title('原始信号');
subplot(3,1,3),plot(n,y2);title('扩展信号');
xlabel('时间/s')


% dt=0.01   ; %采样间隔
% f=3;
% t=0:dt:5;
% x=0.5*sin(2*pi*f*t+1);
% plot(t,x)