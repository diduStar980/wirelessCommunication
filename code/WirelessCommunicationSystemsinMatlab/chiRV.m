function Y = chiRV(k,N)
%% k=degrees of freedom
%% N=Number of samples

Y=0;
for j=1:k,
    Y=Y+randn(1,N).^2;
end
Y=sqrt(Y);
end

