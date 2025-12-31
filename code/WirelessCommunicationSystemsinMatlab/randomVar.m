clear all; close all; clc;

mu=0;sigma=1;
L=100000;
R3=random('Normal',mu,sigma,L,1);%method 1
%% 生成的随机数服从标准正态分布 N(0, 1)

R1=randn(L,1)*sigma + mu;
%% 如果要生成 N(3, 4)（均值 3，方差 4，标准差 2）
%% 只需改为：
%% R = randn(L,1)*2 + 3;



U1=rand(L,1);%%uniformly distributed random numbers U(0,1)
U2=rand(L,1);
Z=sqrt(-2*log(U1)).*cos(2*pi*U2);
R=Z*sigma+mu;
%%使用rand函数生成均匀分布随机数的Box-Muller变换方法。

