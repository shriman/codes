function [ maxGridLocation ] = gridSelectionBasedOnDistance( grid, point )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

row = size(grid,1);

temp = norm(point - grid(1,:));
flag = 1;

for i = 1:1:row
    dis = norm(point - grid(i,:));
    if(temp <= dis)
        flag = i;
        temp = dis;
    end  
end
maxGridLocation = flag;

end