function wallEndedFlag = pledgeDetectWallEnded(cursor, imgBinary, direction)
% Looks at the border of the area left to the current direction. Detects
% the end of a wall which we currently follow.
%
% INPUT
% cursor         ... (x,y) coord. of the area center
% imgBinary      ... binary represenation (wall=0, way=1)
% direction      ... top, left, bottom, right
%
% OUTPUT
% wallEndedFlag  ... boolean - wall ended


wallEndedFlag=false;

%bla=imgBinary([cursor(1,1)-2:cursor(1,1)+2],[cursor(1,2)-2:cursor(1,2)+2])
%pause;


switch direction
    case 0
        area=imgBinary([cursor(1,1)-5:cursor(1,1)],cursor(1,2)-2);
        area=area.';
        if( (mean(area)==1))
            wallEndedFlag=true;
        end
    case 1
        area=imgBinary(cursor(1,1)-2,[cursor(1,2):cursor(1,2)+5]);
        if( (mean(area)==1) )
            wallEndedFlag=true;
        end
    case 2
        area=imgBinary([cursor(1,1):cursor(1,1)+5],cursor(1,2)+2);
        area=area.';
        if( (mean(area)==1) )
            wallEndedFlag=true;
        end
    case 3
        area=imgBinary(cursor(1,1)+2,[cursor(1,2)-5:cursor(1,2)]);
        if( (mean(area)==1) )
            wallEndedFlag=true;
        end
end





%disp('__WALK ALONG__');
%bla=imgBinary([cursor(1,1)-2:cursor(1,1)+2],[cursor(1,2)-2:cursor(1,2)+2])
%area
%pause;

end