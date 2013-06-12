function [ HLRLeft, HLRRight ] = helplessRegion( ERLeft, ERRight, r )
%this function calculates the helpless region of a sensor

HLRLeft = [(ERRight(:,1) - r),(ERRight(:,2) + r)];
HLRRight = [(ERLeft(:,1) + r),(ERLeft(:,2) - r)];


end

