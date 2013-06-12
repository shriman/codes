function [ updatedGrid, updatedGridBenefit ] = gridSelection( grid, threshold )
%implements the equation 29 of the paper ie it takes the total grid with
%grid benefit and then applies a threshhold and seelects those grid points
%whose "grid benefit"  are greater than the threshold and then arranges
%those points in the increasing order of the grid benefit.
%
[r,c,v] = find(grid >= threshold);
 
size_r = size(r,1);

newGrid = [r,c]; % contains the indices of all the elements of the grid whose value is above the threshold
updatedGrid = zeros(size_r,2);  % this contains the indices of the grid elemests after the elemsts are sorted out in descending order

gridBenefit = zeros(size_r,1); 
updatedGridBenefit = zeros(size_r,1);

% store the values of the all nonzero elements after threshholdiing
for i = 1:1:size_r
    gridBenefit(i,1) = grid(r(i),c(i)); 
end

for i = 1:1:size_r
    temp = gridBenefit(i,1);
    flag = i;
    for j = 1:1:size_r
        if(temp >= gridBenefit(j,1))
            temp = temp;
            flag = flag;
        else
            temp = gridBenefit(j,1);
            flag = j;
        end
    end
    %now we have found the ith largest number with its indices as the value
    %of flag. so now store this element in updatedGridBenefit with its
    %indices as elemests of updatedGrid and set the value of this element
    %to zero in the gridBenefit Matrix.
    updatedGridBenefit(i,1) = gridBenefit(flag,1);
    gridBenefit(flag,1) = 0;
    updatedGrid(i,:) = newGrid(flag,:);
    %at the end of this loop the elements are sorted and the indices are
    %also listed in a new array
    
end


end