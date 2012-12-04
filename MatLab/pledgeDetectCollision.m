function collisionFlag = pledgeDetectCollision(cursor, imgBinary, direction)



% move cursor according to direction
switch direction
    case 0
        area=imgBinary((cursor(1,2)-2),[(cursor(1,1)-2): (cursor(1,1)+2)]);
        mValue=mean(area,2);        
    case 1
     	area=imgBinary(cursor(1,1)+2,[cursor(1,2)-2:cursor(1,2)+2]);
        mValue=mean(area);
    case 2
        area=imgBinary([cursor(1,1)-2:cursor(1,1)+2],cursor(1,2)+2);
        mValue=mean(area,2);
    case 3
        area=imgBinary(cursor(1,1)-2,[cursor(1,2)-2:cursor(1,2)+2]);
        mValue=mean(area);
end


if(mValue>0.5)
    collisionFlag=false;
else
    collisionFlag=true;
end


end
