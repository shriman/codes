function [ position, top, bottom] = initialStaticSensorData( a, r)
%This function takes an integer as a input ie the no of static sensor nodes
%in the network and then generates their intial estimative regions.
% the top matrix contains the coordinates of left up point 
%The bottom matrix contains the coordinates of the right down point

sensorPositions = round((rand(a,2))*100);
% sensorPositions_y = round((rand(a,1))*100);
% Rs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];
% Rs1 = limitingValues(Rs1);

leftTop = [sensorPositions(:,1) - r , sensorPositions(:,2) + r];
rightBottom = [sensorPositions(:,1) + r , sensorPositions(:,2) - r];

top = limitingValues(leftTop);
bottom = limitingValues(rightBottom);
position = sensorPositions;

% top = leftTop;
% bottom = rightBottom;
end

