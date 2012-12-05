function [cursor, path] = pledgeCursorShift(cursor, path, direction)
% moves the center of the detection area, which acts as the cursor
% of the detection algorithm
% 
% INPUT
% cursor    ... (x,y) coord. of the area center
% path      ... original image plus path
% direction ... top, left, bottom, right

% 
% OUTPUT
% cursor    ... (x,y) coord. of the area center
% path      ... original image plus path


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
path([cursor(1,1)-1:cursor(1,1)],[cursor(1,2):cursor(1,2)+1],1)=255;

end