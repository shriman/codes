function [ sortedGrid, sortedGridBenefit ] = sortGridBasedonDistance( updatedGrid, updatedGridBenefit )
%this function takes input as the output of the gridSelection.m function
%and its outputs are passed on as input to the
%distancedBasedSelectionPolicy.m function

row = size(updatedGrid,1);
G = updatedGrid;
reverseSortedGridBenefit = zeros(row,1);
point = [1 1];
reverseSortedGrid = zeros(row,2);
flag = zeros(row,1);

for i = 1:1:(row)
    flag(i) = gridSelectionBasedOnDistance(G,point);
    point = updatedGrid(flag(i),:);
    reverseSortedGrid(i,:) = updatedGrid(flag(i),:);
    reverseSortedGridBenefit(i,1) = updatedGridBenefit(flag(i),1);
    for j = 1:1:(i - 1);
        G(flag(j),:) = point;       
    end
end

sortedGrid = zeros(row,2);
sortedGridBenefit = zeros(row,1);
for i = 1:1:row
    j = (row + 1) - i;
    sortedGrid(i,:) = reverseSortedGrid(j,:); 
    sortedGridBenefit(i) = reverseSortedGridBenefit(j);
end


end

