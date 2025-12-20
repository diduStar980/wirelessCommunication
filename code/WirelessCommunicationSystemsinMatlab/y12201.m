A=0.5;
fc=10;
phase=30;
fs=32*fc;
t=0:1/fs:2-1/fs;
phi=phase*pi/180;
x=A*cos(2*pi*fc*t+phi);
figure;
plot(t,x);
N=256;
X=1/N*fftshift(fft(x,N));
df=fs/N;
sampleIndex=-N/2:N/2-1;
f=sampleIndex*df;
stem(f,abs(X));
xlabel('f(Hz)');ylabel('X|k|)');

phase=atan2(imag(X),real(X))*180/pi;
plot(f,phase);

X2=X;
threshold=max(abs(X))/10000;
X2(abs(X)<threshold)=0;
phase=atan2(imag(X2),real(X2))*180/pi;
stem(f,phase);

x_recon=N*ifft(ifftshift(X),N);
t=[0:1:length(x_recon)-1]/fs;
plot(t,x_recon);











