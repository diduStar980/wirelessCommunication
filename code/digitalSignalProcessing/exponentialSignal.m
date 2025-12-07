n=[-10:10];
alpha=-0.1+0.3*j;
x=exp(alpha*n);
Real_x=real(x) %%实部
Image_x=imag(x); %%虚部
Mag_x=abs(x); %%振幅
Phase_x=rad2deg(angle(x)); %%取复指数信号的相位，转化为度。rad2deg函数将弧度转化为度
subplot(2,2,1),stem(n,Real_x);
title('实部'),xlabel('n');
grid on;
subplot(2,2,2),stem(n,Image_x);
title('虚部'),xlabel('n');
grid on;
subplot(2,2,3),stem(n,Mag_x);
title('振幅'),xlabel('n');
grid on;
subplot(2,2,4),stem(n,Phase_x);
title('相位'),xlabel('n');
grid on;