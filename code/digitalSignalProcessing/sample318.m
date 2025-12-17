dt=0.02;N=512;
n=0:N-1;
t=n*dt;f=n/(N*dt);
f1=3;f2=10;
x=0.5*sin(2*pi*f1*t)+cos(2*pi*f2*t);
subplot(2,2,1),plot(t,x);
title('时间域的原始信号');xlabel('时间/S');
y=fft(x);
subplot(2,2,2),plot(f,abs(y)*2/N);
xlabel('频率'),ylabel('振幅');
xlim([0 50]);title('原始振幅谱');

f1=8;f2=15;
yy=zeros(1,length(y));
for m=0:N-1
    if(m/(N*dt)>f1&&m/(N*dt)<f2)|(m/(N*dt)>(1/dt-f2)&&m/(N*dt)<(1/dt-f1))
            %%小于折叠频率的滤波范围
            %%在MATLAB中，续行符 ... 必须在一行的末尾，不能出现在逻辑表达式的中间
            %%大于折叠频率的滤波范围
        yy(m+1)=0; %%在此范围内的振幅为0
    else
        yy(m+1)=y(m+1); %%其余频率范围的振幅不变
    end
end
subplot(2,2,4),plot(f,abs(yy)*2/N);
xlim([0 50]);xlabel('频率'),ylabel('振幅');
gstext=sprintf('%[WTBZ]4.1f-% [WTBZ]4.1fHz的频率被滤除',f1,f2);
%%将滤波范围显示作为标题
title(gstext);
subplot(2,2,3),plot(t,real(ifft(yy)));
title('通过ifft返回时间域');
xlabel('时间/s')




