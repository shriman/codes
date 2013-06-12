function [ flag ] = belong2HLRwithoutER( HLRLeft, HLRRight, point )
%This function checks if the given point lies in the helplessregion whose
%Leftmost and right most points are HLRLeft and HLRRight
%flag = 1 for point belongs to HLR 
%flag  = 0 for point does not belong to HLR

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

