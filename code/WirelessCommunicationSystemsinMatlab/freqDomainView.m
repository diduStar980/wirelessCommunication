function [SIGNAL,fVals] = freqDomainView(signal,Fs,type)
%Returns raw FFT values & frequency bins for the time domain signal
%signal - discrete-time domain representation of a signal
%Fs - sampling frequency of the discrete-time representation
%type - 'single' or 'double' - returns the single/double sided FFT

NFFT=2^nextpow2(length(signal)); %FFT length
if (nargin ==1), 
    Fs=1; 
    type='double'; 
end

if (nargin==2), 
    type='double'; 
end

if strcmpi(type,'single'), %single sided FFT
    SIGNAL=fft(signal,NFFT);
    SIGNAL=SIGNAL(1:NFFT/2);
    fVals=Fs*(0:NFFT/2-1)/NFFT;%% 频率轴的计算
else
    SIGNAL=fftshift(fft(signal,NFFT));
    fVals=Fs*(-NFFT/2:NFFT/2-1)/NFFT;
end

end

%% fftshift 函数的作用是：
%% 将 FFT 结果的零频（直流分量）从频谱的起始位置移到中心位置，以便更直观地显示双边频谱。