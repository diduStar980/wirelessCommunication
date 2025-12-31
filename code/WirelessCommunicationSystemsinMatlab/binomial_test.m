n=30;
p=1/6;
X=binomialRV(n,p,10000);
X_pdf=pdf('Binomial',0:n,n,p);%%计算二项分布的理论概率质量函数值，取所有可能取值0到n
histogram(X,'Normalization','pdf');
hold on;
plot(0:n,X_pdf,'r');