N=100;dt=1;
n=0:N-1;t=n*dt;
x=cos(pi*t/2);
k=0:N-1;f=k/(N*dt);
X=dfs(x,N);
realX=real(X);
imagX=imag(X);
Xrealshft=cirshftt(realX,10,N);
Ximagshft=cirshftt(imagX,10,N);
Y=idfs(Xrealshft+j*Ximagshft,N);

subplot(2,2,1),plot(t,real(Y));
ylim([-1 1]);
xlabel('时间/S');
title('移位后信号频率域的实部');
subplot(2,2,2),plot(t,imag(Y));
xlabel('时间/S');
title('移位后信号频率域的虚部');
subplot(2,2,3),plot(t,x.*real(exp(j*2*pi*n*10/N)));
xlabel('时间/S');
title('x.*real(exp(j*2*pi*n*10/N)傅里叶变换的实部');
subplot(2,2,4),plot(t,x.*imag(exp(j*2*pi*n*10/N)));
xlabel('时间/S');
title('x.*imag(exp(j*2*pi*n*10/N)傅里叶变换的虚部');


