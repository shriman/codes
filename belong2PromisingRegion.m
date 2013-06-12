function [ flag0 ] = belong2PromisingRegion( ERLeft, ERRight, point ,r)
%This function firsty calculates the promising region fo the given
%estimative region and then checks if the given point "point" is in the promising region

%[HLRLeft, HLRRight] = helplessRegion( ERLeft, ERRight, r);
%flag0 = 1 point belongs to promising region
%flag0 = 0 point does not belong to promising region
%flag3 = 1 belong to bigger rectangle of promising region
%flag3 = 0 does not belong to bigger rectangle of promising region 
flag = belong2HLR(ERLeft, ERRight, point,r);

[PRLeft1, PRLeft2, PRRight1, PRRight2] = promisingRegion(ERLeft, ERRight, r);

if((PRLeft1(1,1) <= point(1,1)) && (point(1,1) <= PRRight1(1,1)))
    flag1 = 1;
else
    flag1 = 0;
end

if(((PRRight1(1,2) <= point(1,2)))&&(point(1,2) <= PRLeft1(1,2)))
    flag2 = 1;
else
    flag2 = 0;
end

flag3 = flag1*flag2;

if((flag == 1) && (flag3 == 1))
    flag0 = 0;
else if((flag == 0) && (flag3 == 1))
        flag0 = 1;
    else 
        flag0 = 0;      
    end


end

