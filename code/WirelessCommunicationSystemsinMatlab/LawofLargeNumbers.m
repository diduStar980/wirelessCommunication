n=1000;
p=0.7;
X=bernoulliRV(n,p);
y_sum=sum(triu(repmat(X,[prod(size(X)) 1])'));
% prod(size(X))：计算 X 的元素总数（即 n）
% repmat(X,[n 1])：将 X 复制成一个 n 行 1 列的矩阵，每行都是相同的 X
% ...'：转置，变成 1 行 n 列的矩阵重复 n 次（实际上是 n 行 n 列，每列相同）
% triu(...)：提取矩阵的上三角部分（含对角线），下三角变为 0
avg=y_sum./(1:1:n);
plot(1:1:n,avg,'.');
hold on;
xlabel('Trial #'); ylabel('Probability of Heads');
plot(p*ones(1,n),'r'); legend('average','expected');