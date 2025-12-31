function [hw] = Jakes_filter(f_max,Ts,N)
%Ts = sampling interval in seconds
%N = desired filter order
%Returns the windowed impulse response of the FIR filter

L=N/2;
n=1:L;
J_pos=besselj(0.25,2*pi*f_max*n*Ts)./(n.^0.25);
J_neg = fliplr(J_pos);
J_0 = 1.468813*(f_max*Ts)^0.25;%%在 Jakes 滤波器代码中，J_0 表示 冲激响应在 n=0 时刻的值
J = [J_neg J_0 J_pos]; %Jakes filter

n=0:N; 
hamm = 0.54-0.46*cos(2*pi*n/N);%Hamming window
hw = J.*hamm;
hw = hw./sqrt(sum(abs(hw).^2));%Normalized impulse response

figure; subplot(1,2,1); plot(hw); axis tight;
title('Windowed impulse response');
xlabel('n'); ylabel('h_w[n]');

[fftVals,freqVals]=freqDomainView(hw,1/Ts,'double');%section 1.3.4
H_w = (Ts/length(hw))*abs(fftVals).^2;%PSD H(f)
subplot(1,2,2); plot(freqVals,H_w); grid on; xlim([-20 20]);
title('Jakes Spectrum');xlabel('f');ylabel('|H_{w}(f)|ˆ2');

end