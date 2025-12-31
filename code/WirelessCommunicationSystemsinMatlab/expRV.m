function T = expRV(lambda,L)
%lambda - rate parameter, L - length of the sequence generated
U=rand(1,L);
T=-1/lambda*(log(1-U));
end

%% 速率参数 λ 表示单位时间内事件发生的平均次数，
%% 而 t 表示建模过程中直至下一个事件发生所需的时间单位数。