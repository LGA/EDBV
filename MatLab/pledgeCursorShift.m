function [cursor, path] = pledgeCursorShift(cursor, path, direction)


% move cursor according to direction
switch direction
    case 0
        cursor(1,1)=cursor(1,1)-1;
    case 1
        cursor(1,2)=cursor(1,2)+1;
    case 2
        cursor(1,1)=cursor(1,1)+1;
    case 3
        cursor(1,2)=cursor(1,2)-1;
end
            

% add pixel to path (painting it red)
path([cursor(1,1)-1:cursor(1,1)],[cursor(1,2):cursor(1,2)+1],2:3)=0;

end