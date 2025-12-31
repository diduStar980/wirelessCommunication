clc 
clear all
close all
a = randn(10000,1);
subplot(1,2,1)
h1 = histogram(a);
subplot(1,2,2)
h2 = histogram(a,20);