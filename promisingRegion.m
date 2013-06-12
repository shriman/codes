function [ PRLeft1, PRLeft2, PRRight1, PRRight2 ] = promisingRegion( ERLeft, ERRight, r )
% this function calculates the promising region
% PRLeft1 is the left most point, PRLeft2 is the left top poinof the inner
% rectangle ie the left top of the helpless region
%PRRight1 is the Right most bottom point of the promising region
%PRright2 is the right bottom point of the HLR  ie the HLRRight

PRLeft1 = [(ERLeft(:,1) - r),(ERLeft(:,2) + r)];
PRLeft2 = [(ERRight(:,1) - r),(ERRight(:,2) + r)];

PRRight1 = [(ERRight(:,1) + r),(ERRight(:,2) - r)];
PRRight2 = [(ERLeft(:,1) + r),(ERLeft(:,2) -r)];



end

