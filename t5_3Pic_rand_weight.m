%%%Random Weight Matrix (asymmetric & symmetric)
%%%In this version, patterns are established in accordance to pictures.

clear, clc

pict
xd = [p11; p22];
[ndistorts, units] = size(xd);

%%%Learn
w = normrnd(0 ,1 ,units, units);
%w = 0.5 * ( w + w' );   %[Change]Make the weight matrix symmetric

ed_ini = - diag(xd * w * xd')%energy of distorted patterns

%update
itr = 0;
maxitr = 100;
ed = zeros(ndistorts, maxitr);
for itr = 1:maxitr
    for n = 1:ndistorts
        permute = randperm(units); 
        for i = permute   %update asynchronously
            xd(n,i) = sgn(w(i,:) * xd(n,:)')';
        end
        ed(n, itr) = - xd(n,:) * w * xd(n,:)'; %energy of distort patterns
    end
end 

ed = [ed_ini, ed];

for i = 1:size(ed,1)
    plot(1:size(ed,2), ed(i,:));
    hold on
end


hold off
