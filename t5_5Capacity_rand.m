%capacity using random patterns
%result: The capacity of Hopfield network is around 0.138

clc, clear, pict

x = [];
create = 300; %test through 300 random patterns
N=1024;

capacity = [];
for i = 1 : create
    x= [x;sgn(randn(1,1024))]; %bias
    W  = x' * x;
    
    c=0;
    for j = 1:i
        if isequal(sgn(W * x(j,:)')', x(j,:))
            c = c+1;
        end
    end
    c=c/i;
    capacity = [capacity, c];
end

plot(capacity);
