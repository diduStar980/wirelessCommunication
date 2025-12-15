N=100;dt=1;
n=0:N-1;t=n*dt;
x=sin(2*pi*0.1*t)+0.5*cos(2*pi*0.2*t);
xe=0.5*cos(2*pi*0.2*t);
xo=sin(2*pi*0.1*t);
k=0:N-1;
f=k/(N*dt);

X=dfs(x,N);
XE=dfs(xe,N);
XO=dfs(xo,N);

XR=real(X);
XI=imag(X);

subplot(2,2,1);plot(f,XR*2/N);grid on;
xlabel('频率/Hz');ylabel('Re(X)');
title('信号傅里叶变换的实部')

subplot(2,2,2);plot(f,XI*2/N);grid on;
xlabel('频率/Hz');ylabel('Im(X)');
title('信号傅里叶变换的虚部')

subplot(2,2,3);plot(f,real(XE)*2/N);grid on;%%如果只写XE,会得到一个复值序列，matlab会报错
xlabel('频率/Hz');ylabel('XE)');
title('信号偶函数傅里叶变换')

subplot(2,2,4);plot(f,imag(XO)*2/N);grid on;
xlabel('频率/Hz');ylabel('XO)');
title('信号奇函数傅里叶变换')











