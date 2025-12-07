clear all
N=256;dt=0.02;
n=0:N-1;t=n*dt;
x=sin(2*pi*t)+0.5*sin(2*pi*5*t);
m=floor(N/2)+1;%%真实信号的频谱是 共轭对称的,只需要计算前一半频率0～fs/2
a=zeros(1,m);b=zeros(1,m);
for k=0:m-1
    for ii=0:N-1;
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);%%MATLAB 的数组下标是从1开始
end
subplot(2,1,1),plot(t,x);
title('原始信号'),xlabel('时间/S')
subplot(2,1,2),plot((0:m-1)/(N*dt),c)
title('傅里叶变换')

if (mod(N,2) ~= 1)
    a(m)=a(m)/2;
end

for ii=0:N-1
    xx(ii+1)=a(1)/2;
    for k=1:m-1
        xx(ii+1)=xx(ii+1)+a(k+1)*cos(2*pi*k*ii/N)+b(k+1)*sin(2*pi*k*ii/N);
    end
end

subplot(2,2,1)
plot((0:N-1)*dt,x)
title('原始信号')

