clc;
fc=210;
fm=10;%调制信号的频率
alpha=1;
theta = pi/4;
beta = pi/5;
receiverKnowsCarrier = 'False';

fs=8*fc;
duration = 0.5;
t=0:1/fs:duration-1/fs;

%phase modulation
m_t=alpha*sin(2*pi*fm*t+theta);
x=cos(2*pi*fc*t+beta+m_t);

figure(); subplot(2,1,1);plot(t,m_t);
title('modulating signal');xlabel('t');ylabel('m(t)');
subplot(2,1,2);plot(t,x);
title('modulated signal');xlabel('t');ylabel('x(t)');

%%add AWGN noise to the transmitted signal
nMean = 0; nSigma = 0.1;
n = nMean + nSigma*randn(size(t));
r = x + n;

%%demodulation
z=hilbert(r);
inst_phase = unwrap(angle(z));

if strcmpi(receiverKnowsCarrier,'True')
    offsetTerm = 2*pi*fc*t+beta;
else
    p = polyfit(t,inst_phase,1);%%这里 1 表示进行一阶多项式拟合，即直线拟合。
    estimated = polyval(p,t); %%根据 polyfit 得到的多项式系数 p，计算在自变量 t 的各个点处的预测值（拟合值）
    offsetTerm = estimated;
end

demodulated = inst_phase - offsetTerm;
figure();plot(t,demodulated);
title('demodulated signal');xlabel('n');ylabel('\hat{m(t)}');










