% 频率分辨率的定义是DFT频域相邻刻度之间的实际频率之差。
% 
% 如果你只截取了t秒的数据，那么你的频率分辨率是1/ t 。
% 
% 原因很简单:
% 
% 数据只有t秒，信号的成分中周期最大也就是t秒，频率最低就是1/ t，这就是频率分辨率。

dt=0.02;%采样间隔
df=1/(6000*dt);%频率分辨率 频率分辨率=1/总采样时间
n=0:2999; %利用实信号频谱的对称性，只处理频谱的前一半（正频率部分）
f=n*df;
sig=rand(1,length(n));%信号振幅谱
filt=[ones(1,5/df),zeros(1,(length(n)-5/df))];%理想滤波器幅频响应函数
[y,n1]=sigmult(filt,n,sig,n);

subplot(3,1,1),plot(n*df,sig);
title('原始信号振幅谱');

subplot(3,1,2),plot(n*df,filt,'LineWidth',3);
title('滤波器振幅谱');

subplot(3,1,3),plot(n1*df,y);
title('滤波后振幅谱');
xlabel('频率/Hz')