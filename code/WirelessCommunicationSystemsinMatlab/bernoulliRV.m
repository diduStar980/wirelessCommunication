function X = bernoulliRV(L,p)
%%% L is the length of the sequence generated
U=rand(1,L);
X=(U<p);

end
