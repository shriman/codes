function [ beaconLocations ] = distanceBasedSelectionPolicy( sortedGrid, ERLeft, ERRight, r )
%this function implements the distance based selection procedure and the
%input updatedGrid is the output obtained after thresholding the gris using
%grid selection.m function.


row = size(sortedGrid,1);

if(row == 0)
    display('Please decrease the threshold')
    return
end


% beaconLocations = zeros(row,2); %stores the updated beacon location list where the mobile beacon will traverse

G = sortedGrid;

[HLRLeft0, HLRRight0] = helplessRegion(ERLeft,ERRight,r);

[ERNewLeft1, ERNewRight1] = newEstimativeRegion(ERLeft,ERRight,G(1,:),r);  
[HLRLeft1, HLRRight1] = helplessRegion(ERNewLeft1,ERNewRight1,r);

[HLRNewLeft, HLRNewRight] = union(HLRLeft0,HLRRight0,HLRLeft1,HLRRight1);


%minimumGridLocation is the index of point in the which is closest to "point"
for i = 2:1:row
    point = G(i,:);
    [ERNewLeft1, ERNewRight1] = newEstimativeRegion(ERNewLeft1,ERNewRight1,point,r);
    [HLRLeft2,HLRRight2] = helplessRegion(ERNewLeft1,ERNewRight1,r); 
    [HLRNewLeft, HLRNewRight] =  union(HLRNewLeft,HLRNewRight,HLRLeft2,HLRRight2);
       
end

beaconLocations = G;

end

