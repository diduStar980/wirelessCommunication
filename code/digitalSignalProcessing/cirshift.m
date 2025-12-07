function y = cirshift(x,m,N)
if length(x)>N
    error('N must >=the length of x')
end
x=[x zeros(1,N-length(x))];
n=[0:1:N-1];
n=mod(n-m,N);
y=x(n+1);