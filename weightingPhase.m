function [ gridBenefit ] = weightingPhase( ERLeft, ERRight, r ,net)
%The gridBenefit here is a matrix containg the total benefit of all the grids
%this "griBenefit" is to be used for benefit "based selection policy" and the
%for the "Distance Based selection policy"
%   Detailed explanation goes here

% [prLeft1, prLeft2, prRight1, prRight2] = promisingRegion(ERLeft,ERRight, r);
% [ HLRLeft, HLRRight ] = helplessRegion( ERLeft, ERRight, r )

grid = zeros(100,100);
[row, column] = size(ERLeft);


for i = 1:1:row
    for j = 1:1:net
        for k = 1:1:net
            
            point = [j,k];
            ERTop = ERLeft(i,:);
            ERBottom = ERRight(i,:);
%             rangeConstraint = [(j - r) (k + r); (j +r) (k - r)];
%             RangeConstraint = limitingValues(rangeConstraint);
            
            flag = belong2PromisingRegion(ERTop,ERBottom,point,r);
            if(flag == 0)
                grid(j,k) = grid(j,k) + 0;
            else
                [NERLeft, NERRight] = newEstimativeRegion(ERTop,ERBottom,point,r);
                NERArea = (((NERRight(1,1) - NERLeft(1,1))+1)*((NERLeft(:,2) - NERRight(:,2))+1));
                ERArea = (((ERBottom(1,1) - ERTop(1,1))+1)*((ERTop(1,2) - ERBottom(1,2))+1));
                benefit_1 = benefitCalculation(ERTop,ERBottom,NERLeft,NERRight);
                grid(j,k) = round((NERArea*benefit_1)/ERArea);
                
            end
            
        end
    end
end


gridBenefit = grid;
end

