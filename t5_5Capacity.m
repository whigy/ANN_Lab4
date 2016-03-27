%capacity of picture patterns

clc, clear, pict

x_i           = [p1; p2; p3; p4; p5; p6; p7; p8; p9];
% load the attractors.
[p, N]      = size(x_i);

capacity = [];

for i = 1 : 9 %Test through storing one one pattern, two patterns, ... nine patterns
    x= x_i(1:i, :);
    W  = x' * x;
    
    c=0;
    for j = 1:i
        if isequal(sgn(W * x(i,:)')', x(i,:))
            c = c+1;
        end
    end
    c=c/i;
    capacity = [capacity, c];
end

plot(capacity);
xlabel('Size of stored pattern');
ylabel('Rate of successfully stored pattern');
