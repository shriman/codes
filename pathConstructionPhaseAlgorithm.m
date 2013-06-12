function [ P,Em ] = pathConstructionPhaseAlgorithm( beaconLocations,sortedGridBenefit, initialMobileSensorPosition )
%finds the optimal path for the mobile sensor to to traverse and estimates
%the energy required during the process

point = initialMobileSensorPosition;
row = size(beaconLocations,1);
GB = sortedGridBenefit;
G = beaconLocations;
P = zeros((row+1),2);
P(1,:) = initialMobileSensorPosition;
Em = 0;
E_p = 0.98;
E_beacon = 0.017;
E_turn = 3;
E_stop = 0.7;


for i = 1:1:row+1
    flag = maxGridBenefitByDistance(G,GB,point);           
    
    if(G(flag,1) == point(1,1))
        turn = 0;
    else if(G(flag,2) == point(1,2))
            turn = 0;
        else
            turn = 1;
        end        
    end
    P(i,:) = point;
    point = G(flag,:);
    Em = Em + E_stop + E_beacon + turn*E_turn + (norm(point - beaconLocations(flag,:))*E_p);
    
    if(i ~= (row+1))
        temp1 = G(end,:);
        G(flag,:) = temp1;
        G = G(1:(end-1),:);

        temp2 = GB(end);
        GB(flag) = temp2;
        %GB(flag) = GB(end);
        GB = GB(1:(end-1),:);
    end
%     temp1 = G(end,:);
%     G(flag,:) = temp1;
%     G = G(1:(end-1),:);
%     
%     temp2 = GB(end);
%     GB(flag) = temp2;
%     %GB(flag) = GB(end);
%     GB = GB(1:(end-1),:);
    
end


end

