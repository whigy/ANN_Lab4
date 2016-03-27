%capacity using random patterns
%Test capacity & stablility
%Test with using non-bias & bias patterns ; self-connection & non-self

clc, clear, pict

x=[];
create = 50;
N=100;

capacity = [];
stablity = [];
for i = 1 : create
    x = [x;sgn(randn(1,100))]; %[Change]non-bias patterns
    %x = [x;sgn(randn(1,100)+0.5)]; %[Change]bias patterns
    W = x' * x;
    W = W + diag(-diag(W)); %[Change]remove self-connection or not
    c=0;
    s = 0;
    for j = 1:i
        if isequal(sgn(W * x(j,:)')', x(j,:))
            c = c+1;
            if j~=i
                s=s+1;
            end
        end
    end
    c=c/i;
    capacity = [capacity, c];
    if i == 1
        s = 0;
    else
        s = s/(i-1);
    end
    stablity = [stablity, s];
end

subplot(1,2,1);
plot(capacity);
title('capacity');
subplot(1,2,2);
plot(stablity);
title('stablity');