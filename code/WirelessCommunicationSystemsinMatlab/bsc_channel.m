function y = bsc_channel(x,e)

y = x;
errors=rand(1,length(x))<e;
y(errors) = 1-y(errors);

end