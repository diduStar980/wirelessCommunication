N=1000;
c=randn(1,N)>0.5;
c_cap=randn(1,N)>0.5;
BER=sum((c~=c_cap))/N;