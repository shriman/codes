function [ ERnewLeft, ERnewRight ] = newEstimativeRegion( ERoldLeft, ERoldRight , seedPosition, r )
%funtion to calculate the new estimative region using the Estimative region
%and the range constraint of the mobile sensor

[row, column] = size(ERoldRight);

ERnewLeft  = zeros(row , column);
ERnewRight = zeros(row , column);
xm = seedPosition(1,1);
ym = seedPosition(1,2);
RangeConstraint = [(xm - r),(ym - r); (xm + r),(ym + r)];
RangeConstraint = limitingValues(RangeConstraint);

for i = 1:1:row
    
    x1 = ERoldLeft(i,1);
    y1 = ERoldLeft(i,2);
    
    x2 = ERoldRight(i,1);
    y2 = ERoldRight(i,2);
    
    x3 = RangeConstraint(1,1);
    y3 = RangeConstraint(1,2);
    
    x4 = RangeConstraint(2,1);
    y4 = RangeConstraint(2,2);
    
%     x5 = ERnewLeft(i,1);
%     y5 = ERnewLeft(i,2);
%     
%     x6 = ERnewRight(i,1);
%     y6 = ERnewRight(i,2);
    
       %((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x5 = x1;
y5 = y1;
x6 = x2;
y6 = y2;
%case 1
if(((x1 <= x4) && (x4 <= x2)) && ((y1 <= y4) && (y4 <= y2)))
    x6 = x4;
    y6 = y4;
end

%case 2
if(((x1 <= x3) && (x3 <= x2)) && ((y1 <= y4) && (y4 <= y2)))
    x5 = x3;
    y6 = y4;
end

%case 3
if(((x1 <= x4) && (x4 <= x2)) && ((y1 <= y3) && (y3 <= y2)))
    x6 = x4;
    y5 = y3;
end

%case 4
if(((x1 <= x3) && (x3 <= x2)) && ((y1 <= y3) && (y3 <= y2)))
    x5 = x3;
    y5 = y3;
end
    
%case 5
if(((x1 <= x3) && (x3 <= x2)) && ((y3 < y1) && (y4 > y2)))
    x6 = x4;
end

%case 6
if(((x1 <= x4) && (x4 <= x2)) && ((y3 < y1) && (y4 > y2)))
    x5 = x3;
end

%case 7
if(((x3 < x1) && ( x4 > x2)) && ((y1 <= y3) && (y3 <= y2)))
    y5 = y3;
end
    
%case 8
if(((x3 < x1) && ( x4 > x2)) && ((y1 <= y4) && (y4 <= y2)))
    y6 = y4;
end
    



% 
%  if((x1 <= x4)&&(x4 <= x2))
%      if((y1 <= y4)&&(y4 <= y2))
%          x6 = x4;
%          y6 = y4;
%      end
%      if(y4 < y1)
%          x6 = x2;
%          y6 = y2;
%      end
%      if(y4 > y2)
%          x6 = x4;
%          y6 = y2;
%      end
%  end
% 
%  if(x4 < x1)
%      x6 = x2;
%      y6 = y2;
%  end
%  
%  if(x4 > x1)
%      if(y4 < y1)
%          x6 = x2;
%          y6 = y2;
%      end
%      if((y1 <= y2)&&(y4 <= y2))
%          x6 = x2;
%          y6 = y4;
%      end
%      if(y4 > y2)
%          x6 = x2;
%          y6 = y2;
%      end
%  end
%  
%  
%  
%      
%  if((x1 <= x3)&&(x3 <= x2))
%      if((y1 <= y3)&&(y3 <= y2))
%          x5 = x3;
%          y5 = y3;
%      end
%      if(y3 > y2)
%          x5 = x1;
%          y5 = y1;
%      end
%      if(y3 < y1)
%          x5 = x3;
%          y5 = y1;
%      end
%  end   
%  
%  
%  if(x3 > x2)
%      x5 = x1;
%      y5 = y1;
%  end
%  
%  
%  if(x3 < x1)
%      if(y3 > y2)
%          x5 = x1;
%          y5 = y1;
%      end
%      if((y1 <= y3)&&(y3 <= y2))
%          x5 = x1;
%          y5 = y3;
%      end
%      if(y3 > y1)
%          x5 = x1;
%          y5 = y1;
%      end
%  end
 
ERnewLeft(i,1) = x5;
ERnewLeft(i,2) = y5;
ERnewRight(i,1) = x6;
ERnewRight(i,2) = y6;
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
%     if(((x1 <= x3) && (x3 <= x2)) && ((y2 <= y3) && (y3 <= y1)))
%         ERnewLeft(i,1) = x3;
%         ERnewLeft(i,2) = y3;
%     else
%         ERnewLeft(i,1) = x1;
%         ERnewLeft(i,2) = y1;
%     end
%     
%     
%     if(((x1 <= x4) && (x4 <= x2)) && ((y2 <= y4) && (y4 <= y1)))
%         ERnewRight(i,1) = x4;
%         ERnewRight(i,2) = y4;
%     else
%         ERnewRight(i,1) = x2;
%         ERnewRight(i,2) = y2;        
%     end
%     
    

%     
%        if (RangeConstraint(1,1) < ERoldLeft(i,1))
%            ERnewLeft(i,1) = ERoldLeft(i,1);
%        else if ((ERoldLeft(i,1) <= RangeConstraint(1,1))&& (RangeConstraint(1,1) <= ERoldRight(i,1)))
%                ERnewLeft(i,1) = RangeConstraint(1,1);
% 
%            else if(RangeConstraint(1,1) > ERoldRight(i,1))
%                    ERnewLeft(i,1) = ERoldLeft(i,1);
%                end
%            end
%        end       
%     
%        
%        if (RangeConstraint(2,1) < ERoldLeft(i,1))
%            ERnewRight(i,1) = ERoldRight(i,1);
%        else if ((ERoldLeft(i,1) <= RangeConstraint(2,1))&& (RangeConstraint(2,1) <= ERoldRight(i,1)))
%                ERnewRight(i,1) = RangeConstraint(1,1);
% 
%            else if(RangeConstraint(2,1) > ERoldRight(i,1))
%                    ERnewRight(i,1) = ERoldRight(i,1);
%                end
%            end
%        end 
% 
%        
%        if (RangeConstraint(1,2) > ERoldLeft(i,2))
%            ERnewLeft(i,2) = ERoldLeft(i,2);
%        else if ((ERoldRight(i,2) <= RangeConstraint(1,2)) && (RangeConstraint(1,2) <= ERoldLeft(i,2)))
%                ERnewLeft(i,2) = RangeConstraint(1,2);
% 
%            else if(RangeConstraint(1,2) < ERoldRight(i,2))
%                    ERnewLeft(i,2) = ERoldLeft(i,2);
%                end
%            end
%        end 
%        
%        if (RangeConstraint(2,2) > ERoldLeft(i,2))
%            ERnewRight(i,2) = ERoldRight(i,2);
%        else if ((ERoldRight(i,2) <= RangeConstraint(2,2)) && (RangeConstraint(2,2) <= ERoldLeft(i,2)))
%                ERnewRight(i,2) = RangeConstraint(2,2);
% 
%            else if(RangeConstraint(2,2) < ERoldRight(i,2))
%                    ERnewRight(i,2) = ERoldRight(i,2);
%                end
%            end
%        end 
% end




end
