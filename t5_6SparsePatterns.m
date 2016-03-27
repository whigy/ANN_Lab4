%Sparse Patterns
%Test is not successfull TAT

clc, clear

epochs = 50;
rho = 0.1;  %sparse rate, rho = 0.1 or 0.05 or 0.01 %only 10% neurons active
theta = -1:0.1:1; %bias rate

x = zeros(300,100);
[p, n] = size(x);
for i = 1:p
    activeUnitsIndices = randperm(n, n * rho);
    x(i,activeUnitsIndices) = 1;
end

W = (x-rho)' * (x-rho);
%W = W + diag(-diag(W));

capacity = [];
for bias = theta
    d = 0.5 + (0.5 * sgn((W * x')' - bias)); %Slightly update rule
    c = sum(ismember(d, x,'rows'));
    capacity = [capacity, c/p];
end

plot(theta, capacity);
   