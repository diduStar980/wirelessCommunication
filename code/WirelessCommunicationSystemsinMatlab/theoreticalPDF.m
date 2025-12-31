X = -4:0.1:4; %range of x to compute the theoretical pdf
fx_theory = 1/sqrt(2*pi*sigma^2)*exp(-0.5*(X-mu).^2./sigma^2);
plot(X,fx_theory,'k'); %plot computed theoretical PDF