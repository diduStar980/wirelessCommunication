C=[ 1 0.5 0.3; 0.5 1 0.3; 0.3 0.3 1 ;];
U=chol(C);%Cholesky decomposition

R=randn(10000,3);
Rc=R*U; 

coeffMatrixXX=corrcoef(Rc(:,1),Rc(:,1));
coeffMatrixXY=corrcoef(Rc(:,1),Rc(:,2));
coeffMatrixXZ=corrcoef(Rc(:,1),Rc(:,3));

coeffXX = coeffMatrixXX(1,2) %Correlation Coeff for XX;
coeffXY = coeffMatrixXY(1,2) %Correlation Coeff for XY;
coeffXZ = coeffMatrixXZ(1,2) %Correlation Coeff for XZ;

subplot(1,3,1);plot(Rc(:,1),Rc(:,1),'b.');
title(['X and X, \rho=' num2str(coeffXX)]);xlabel('X');ylabel('X');
subplot(1,3,2);plot(Rc(:,1),Rc(:,2),'r.');
title(['X and Y, \rho=' num2str(coeffXY)]);xlabel('X');ylabel('Y');
subplot(1,3,3);plot(Rc(:,1),Rc(:,3),'k.');
title(['X and Z,\rho=' num2str(coeffXZ)]);xlabel('X');ylabel('Z');

% 对于任意两个变量A和B，corrcoef(A,B) 返回：
% 
% [ corr(A,A)  corr(A,B)
%   corr(B,A)  corr(B,B) ]
% = [  1       ρ_AB
%      ρ_BA     1    ]