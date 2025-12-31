function [Xi,Ti] = poissonProcess(lambda,n)

Xi=zeros(1,n+1);
Xi(2:n+1)=expRV(lambda,n);
Ti=sum(triu(repmat(Xi,[prod(size(Xi)) 1])'));
end

%%% n denotes the number of events to generate