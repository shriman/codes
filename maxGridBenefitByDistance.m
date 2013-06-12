function [ flag ] = maxGridBenefitByDistance( grid,gridBenefit,point )
%finds the indices of the point"i" whose
%GridBenefit/dist(grid(xi,yi),point) ratio is maximum
row = size(grid,1);
ratio = zeros(row,1);

for i = 1:1:row
    ratio(i,1) = gridBenefit(i,1)/(norm(point - grid(i,:)));
end

[r,c] = find(ratio == max(ratio));
[r1,c1] = find(r == min(r));
flag = r1;
end

