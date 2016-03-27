%x1, x2, x3: original patterns (attractors)
%x1d, x2d, x3d: distorted patterns

clear, clc

%% test the ability to restore
x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);
x1d = vm([1 0 1 0 1 0 0 1]);
x2d = vm([1 1 0 0 0 1 0 0]);
x3d = vm([1 1 1 0 1 1 0 1]);

x = [x1; x2; x3];
xd = [x1d; x2d; x3d];
[npatterns, units] = size(x);
[ndistorts, dummy] = size(xd);
%epochs = floor(log(npatterns));
itr = 0;

w = x' * x;
%w = w + diag(-diag(w)); %This step remove self-connection.

%update
while ~isequal(xd, x) && itr < 100
    itr = itr +1
    xd = sgn(w * xd')';
    xx = t0(xd)
end 
