clear all
close all
N=200;
dt=4/N;
for n=1:N
    if(n*dt>=2)
        x(n)=0.8;
    else
        x(n)=-0.8;
    end
end
figure(1)
subplot(2,1,1),plot((1:N)*dt,x),hold on;
plot((1:N)*dt,zeros(1,N),'k'),xlabel('时间/S')
title('原始信号')
a=zeros(1,N);b=zeros(1,N);
nn=floor(N/2)+1;
for k=0:nn-1
    a(k+1)=0;
    b(k+1)=0;
    for ii=0:N-1
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);
end
subplot(2,1,2),plot((0:nn-1)/(N*dt),c);
m=input('输入谐波最大阶数');
if (m>floor(N/2)+1)
    error('谐波最大阶数必须小于')
end
if(mod(N,2)~=1)
    a(nn)=a(nn)/2;
end
for ii=0:N-1
    xx(ii+1)=a(1)/2;
    for k=1:m
        xx(ii+1)=xx(ii+1)+a(k+1)*cos(2*pi*k*ii/N)+b(k+1)*sin(2*pi*k*ii/N);
    end
end
figure(2)
plot((1:N)*dt,xx,(0:N-1)*dt,x)
hold on
plot((1:N)*dt,zeros(1,N),'k'),xlabel('时间/S')
title('合成信号')











