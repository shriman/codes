function [ beaconLocations, sortedGridBenefit] = benefitBasedSelectionProcedure( updatedGrid,updatedGridBenefit, ERLeft, ERRight, r )
%This function implements the benefit based selection policy, it takes the
%grid location as the ibput and outputs the possible mobile beacon
%locations.

row = size(updatedGrid,1);

if(row == 0)
    display('Please decrease the threshold')
    return
end

noOfSensors = size(ERLeft,1);
G = updatedGrid;
beaconLocations = G(1,:);
index = [];
index(1) = 1;
[HLRLeft0, HLRRight0] = helplessRegion(ERLeft,ERRight,r);

[ERNewLeft1, ERNewRight1] = newEstimativeRegion(ERLeft,ERRight,G(1,:),r);  
[HLRLeft1, HLRRight1] = helplessRegion(ERNewLeft1,ERNewRight1,r);

[HLRNewLeft, HLRNewRight] = union(HLRLeft0,HLRRight0,HLRLeft1,HLRRight1);

flag = zeros(noOfSensors,1);


for i = 2:1:row;
    point = G(i,:);
    for j = 1:1:noOfSensors;
        flag(j) =  belong2HLRwithoutER(HLRNewLeft,HLRNewRight,point);
    end
    flag0 = sum(flag);
    
    if(flag0 == 0)
        index = [index;i];
        beaconLocations = [beaconLocations;point];
        [ERNewLeft1, ERNewRight1] = newEstimativeRegion(ERNewLeft1,ERNewRight1,point,r);
        [HLRLeft2,HLRRight2] = helplessRegion(ERNewLeft1,ERNewRight1,r); 
        [HLRNewLeft, HLRNewRight] =  union(HLRNewLeft,HLRNewRight,HLRLeft2,HLRRight2);
    end
    
end

sortedGridBenefit = zeros(size(index,1),1);
for i = 1:1:size(index,1);
    sortedGridBenefit(i) = updatedGridBenefit(index(i));    
end

end

