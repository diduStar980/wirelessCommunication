dt=0.02   ; %采样间隔
f=3;
t=0:dt:5;
x=0.5*sin(2*pi*f*t+1);
plot(t,x)
xlabel('时间/s')
ylabel('振幅')