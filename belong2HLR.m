function [ flag ] = belong2HLR( ERLeft, ERRight, point,r )
%This function checks if the point is in the helpless region of sensor s
%whose helpless region is denoted by points HLRLeft and HLRRight
%flag = 1 for point belongs to HLR 
%flag  = 0 for point does not belong to HLR

[HLRLeft, HLRRight] = helplessRegion( ERLeft, ERRight, r);

if((HLRLeft(1,1) <= point(1,1)) && (point(1,1) <= HLRRight(1,1)))
    flag1 = 1;
else
    flag1 = 0;
end

if(((HLRRight(1,2) <= point(1,2)))&&(point(1,2) <= HLRLeft(1,2)))
    flag2 = 1;
else
    flag2 = 0;
end

flag =  flag1*flag2;

end

