net = 100; % the total area of the network
% Assuming only two static sensors in the network and one mobile sensor in
% the n/w
xm = 1;% the initial co-ordinates of the mobile anchor
ym = 1;
% s1 = [10 85];
% s2 = [15 47]; foor first test case assuming only one sensor in field
r  = 5; % communication range of each sensor
s1x = round(rand*100); %the x-co-ordinate of the static sensor
s1y = round(rand*100); %the y-co-ordinate of the static sensor

% Broadcasting rectangle
Rm = [(xm - r) (ym + r); (xm +r) (ym - r)];

Rs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];

% a generic solution to the limiting valuse problem

i = 2;
j = 2;
for i = 1:1:2;
    for j = 1:1:2;
      if (Rm(i,j) <= 1)
          Rm(i,j) = 1;            
      
      else if (Rm(i,j) >= 100)
              Rm(i,j) = 100;
          end
      end
      if (Rs1(i,j) <= 1)
          Rs1(i,j) = 1;
      else if (Rs1(i,j) >= 100)
              Rs1(i,j) = 100;
          end
      end
    end
end

% assuming the initial estimative region of the static sensor is its
% communication region
ERs1 = [(s1x - r) (s1y + r); (s1x +r) (s1y - r)];

for i = 1:1:2;
    for j = 1:1:2;
        if (ERs1(i,j) <= 1)
            ERs1(i,j) = 1;
        
        else if (ERs1(i,j) >= 100)
               ERs1(i,j) = 100; 
            end
        end
    end
end    










