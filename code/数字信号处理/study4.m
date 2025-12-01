dt=0.01;t=0:dt:1;
f=10;
x=sin(2*pi*f*t+0.3);
dt=0.1;t1=0:dt:1;
x1=sin(2*pi*f*t1+0.3);
subplot(3,1,1),plot(t,x),ylim([-1 1]);
title('original signal')
subplot(3,1,2),plot(t,x,t1,x1,'*'),ylim([-1 1]);
title('sampling process')
subplot(3,1,3),plot(t1,x1),ylim([-1 1]);
title('signal after sampling'),xlabel('time/s')

