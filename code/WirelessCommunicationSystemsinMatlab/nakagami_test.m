clear
clc

m=[1.8 1 0.75 0.5]; 
w=0.2;
N = 1000000;

lineColors=['r','g','b','c','m','y','k'];
legendString =cell(1,4); 

figure; 
hold on;

for i=1:length(m),
    Y = nakagamiRV(m(i),w,N);
    [Q,X] = hist(Y,1000);%histogram
    plot(X,Q/trapz(X,Q),lineColors(i));
    legendString{i}=strcat('m=',num2str(m(i)),',\omega=',num2str(w));
end

legend(legendString);title('Nakagami-m - PDF ');
xlabel('Parameter - y');ylabel('f_Y(y)');axis([0 2 0 2.6]);

