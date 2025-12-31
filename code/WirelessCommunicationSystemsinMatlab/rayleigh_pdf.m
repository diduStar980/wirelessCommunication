s=1.5;
h=s*(randn(1,10e4)+1i*randn(1,10e4));
[val,bin] = hist(abs(h),100);
plot(bin,val/trapz(bin,val),'r','LineWidth',2);
title('Envelope pdf - Rayleigh distribution');
xlabel('|h|');ylabel('f(|h|)');axis tight;

r = 0:0.1:10; %rayleigh rv
pdf = (r/s^2).*exp(-r.^2/(2*s^2));%theoretical pdf
hold on; plot(r,pdf,'k','LineWidth',2); grid on;
legend('simulated','theoretical');