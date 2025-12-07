clear all
close all
N=100;dt=1;
n=0:N-1;t=n*dt;
xn=cos(2*pi*0.24*t)+cos(2*pi*0.26*t);
Xk=dfs(xn,N);
magXk=abs(Xk);phaXk=angle(Xk);
subplot(2,2,1),plot(t,xn);xlabel('时间/S')
title('原始信号(N=100)');
xx=idfs(Xk,N);
x=real(xx);
subplot(2,2,2),plot(t,x),xlabel('时间/S'),title('逆变换后的信号')
k=0:length(magXk)-1;
subplot(2,1,2),plot(k/(N*dt),magXk*2/N);

