tic;
clear;close; 
net = 100; % the total area of the network
 
% Assuming only two static sensors in the network and one mobile sensor in
% the n/w
xm = 1;% the initial co-ordinates of the mobile anchor
ym = 1;
mobileSensorLocation = [xm,ym];
% s1 = [10 85];
% s2 = [15 47]; foor first test case assuming only one sensor in field

r  = 5; % communication range of each sensor
noOfSensors = 10;
% Broadcasting rectangle
Rm = [(xm - r) (ym + r); (xm +r) (ym - r)];
Rm = limitingValues(Rm);

[sensorPosition, leftTop, rightBottom] = initialStaticSensorData(noOfSensors , r);

ERLeftTop = leftTop;
ERRightBottom = rightBottom;

[ERnewLeftTop, ERnewRightBottom] = newEstimativeRegion(ERLeftTop,ERRightBottom, mobileSensorLocation, r);

benefit = benefitCalculation(ERLeftTop,ERRightBottom,ERnewLeftTop,ERnewRightBottom);

[prLeft1, prLeft2, prRight1, prRight2] = promisingRegion(ERLeftTop,ERRightBottom, r);

totalGridBenefit = weightingPhase(ERLeftTop,ERRightBottom,r,net);

[updatedGrid, updatedGridBenefit] = gridSelection(totalGridBenefit,5);

[beaconLocations1, sortedGridBenefit1 ]= benefitBasedSelectionProcedure(updatedGrid,updatedGridBenefit,ERnewLeftTop,ERnewRightBottom,r);

[ sortedGrid, sortedGridBenefit2 ] = sortGridBasedonDistance( updatedGrid, updatedGridBenefit );

beaconLocations2 = distanceBasedSelectionPolicy( sortedGrid, ERnewLeftTop, ERnewRightBottom, r );

[P1, Em1] = pathConstructionPhaseAlgorithm( beaconLocations1,sortedGridBenefit1, mobileSensorLocation );
[P2, Em2] = pathConstructionPhaseAlgorithm( beaconLocations2,sortedGridBenefit2, mobileSensorLocation );

row1 = size(beaconLocations1,1);
[calcERLeft1,calcERRight1] = newEstimativeRegion(ERnewLeftTop, ERnewRightBottom,beaconLocations1(1,:),r);
for i = 2:1:row1
   [calcERLeft1,calcERRight1] = newEstimativeRegion(calcERLeft1,calcERRight1,beaconLocations1(i,:),r);
    
end

row2 = size(beaconLocations2,1);
[calcERLeft2,calcERRight2] = newEstimativeRegion(ERnewLeftTop, ERnewRightBottom,beaconLocations2(1,:),r);
for i = 2:1:row2
   [calcERLeft2,calcERRight2] = newEstimativeRegion(calcERLeft2,calcERRight2,beaconLocations2(i,:),r);
end
% sensorPosition

scatter(sensorPosition(:,1),sensorPosition(:,2),'b')
hold on;
grid on;

%plot the sensor position 
scatter(calcERLeft1(:,1),calcERLeft1(:,2),'x')  
scatter(calcERRight1(:,1),calcERRight1(:,2),'x')
scatter(calcERLeft2(:,1),calcERLeft2(:,2),'r')
scatter(calcERRight2(:,1),calcERRight2(:,2),'r')

toc;
%ERs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];
% ERs1 = limitingValues(ERs1);

% i = 2;
% j = 2;
% for i = 1:1:2;
%     for j = 1:1:2;
%       if (Rm(i,j) <= 1)
%           Rm(i,j) = 1;            
%       
%       else if (Rm(i,j) >= 100)
%               Rm(i,j) = 100;
%           end
%       end
%       if (Rs1(i,j) <= 1)
%           Rs1(i,j) = 1;
%       else if (Rs1(i,j) >= 100)
%               Rs1(i,j) = 100;
%           end
%       end
%     end
% end

% assuming the initial estimative region of the static sensor is its
% communication region

% ERs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];
% for i = 1:1:2;
%     for j = 1:1:2;
%         if (ERs1(i,j) <= 1)
%             ERs1(i,j) = 1;
%         
%         else if (ERs1(i,j) >= 100)
%                ERs1(i,j) = 100; 
%             end
%         end
%     end
% end    

% NERs1 = newEstimativeRegion(ERs1,Rm);

% benfit = benefitCalculation(ERs1,NERs1);








