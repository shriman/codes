function [ HLRLeft, HLRRight ] = union( HLROldLeft,HLROldRight,HLRNewLeft,HLRNewRight )
%this function takes the union of two regions and returns the outputas a
%new helpless region

%   Detailed explanation goes here

[row, column] = size(HLROldLeft);
HLRLeft = zeros(row,column);
HLRRight = zeros(row,column);

for i = 1:1:row
    if(HLRNewLeft(i,1) <= HLROldLeft(i,1)) 
        HLRLeft(i,1) = HLRNewLeft(i,1);
    else
        HLRLeft(i,1) = HLROldLeft(i,1);
    end
    
    if(HLROldRight(i,1) <= HLRNewRight(i,1))
        HLRRight(i,1) = HLRNewRight(i,1);
    else
        HLRRight(i,1) = HLROldRight(i,1);     
    end
    
    if(HLROldLeft(i,2) <= HLRNewLeft(i,2))
        HLRLeft(i,2) = HLRNewLeft(i,2);
    else
        HLRLeft(i,2) = HLROldLeft(i,2);
    end
    
    if(HLRNewRight(i,2) <= HLROldRight(i,2))
        HLRRight(i,2) = HLRNewRight(i,2);
    else
        HLRRight(i,2) = HLROldRight(i,2);
    end
    
end

end

