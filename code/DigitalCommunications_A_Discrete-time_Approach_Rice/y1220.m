fc=10;
fs=32*fc;%%采样频率
t=0:1/fs:2-1/fs;
x=cos(2*pi*fc*t);
% subplot(3,1,1);plot(t,x);hold on;
% title('x[n]=cos(2 \pi 10 t)');
% xlabel('t=nTs');ylabel('x[n]');
 N=256;
 X=fft(x,N);
% df=fs/N;
% sampleIndex=0:N-1;
% f=sampleIndex*df;
% subplot(3,1,2);stem(sampleIndex,abs(X));
% title('X[k]');
% xlabel('k');ylabel('|X(k)|');
% subplot(3,1,3);stem(f,abs(X));
% title('X[f]');
% xlabel('frequencies(f)');ylabel('|X(f)|');

X1=[(X(N/2+1:N)) X(1:N/2)];%%手动对频率进行重新排列
X2=fftshift(X);
df=fs/N;
sampleIndex=-N/2:N/2-1;
f=sampleIndex*df;
figure;
subplot(2,1,1);stem(sampleIndex,abs(X1));hold on;
stem(sampleIndex,abs(X2),'r');
title('frequency domain');
xlabel('k');ylabel('|X(k)|');

subplot(2,1,2);stem(f,abs(X1));stem(f,abs(X2),'r');
xlabel('frequencies');ylabel('|X(f)|')






