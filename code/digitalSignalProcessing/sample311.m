clf
N=100;dt=0.01;
n=0:N-1;t=n*dt;%%时间序列
f=n/(N*dt);
h=[1 zeros(1,N-1)];%%冲激信号
f0=2;f1=10;
x=chirp(t,f0,1,f1);
xh=conv(x,h);
XH=dfs(xh(1:N),N);

subplot(2,2,1),plot(f,real(XH)*2/N);
xlabel('频率/Hz');
title('信号卷积后傅里叶变换的实部')

subplot(2,2,2),plot(f,imag(XH)*2/N);
xlabel('频率/Hz');
title('信号卷积后傅里叶变换的虚部')

X=dfs(x,N);
H=dfs(h,N);
XH1=X.*H;

subplot(2,2,3),plot(f,real(XH1)*2/N);
xlabel('频率/Hz');
title('频率域乘积的实部')

subplot(2,2,4),plot(f,imag(XH1)*2/N);
xlabel('频率/Hz');
title('频率域乘积的虚部')

