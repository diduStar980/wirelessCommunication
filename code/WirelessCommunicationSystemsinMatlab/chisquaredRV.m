function Y = chisquaredRV(k,N)

Y=0;
for j=1:k,
    Y=Y+randn(1,N).^2;
end