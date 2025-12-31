function X = nonCentralChiSquaredRV(k,lambda,N)

X=(sqrt(lambda)+randn(1,N)).^2;
for i=1:k-1,
    X = X + randn(1,N).^2;
end