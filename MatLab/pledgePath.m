function [path] = pledgePath(imgBinary, imgYSobel, imgXSobel, pathStart, pathEnd, imgGreen, imgOri)
% claculates the way throgh the maze with the algorithm of Pledge
% 
% INPUT
% imgBinary ... binary image (1=corridor, 0=wall)
% imgYSobel ... Sobel gradient - in Y direction 
% imgXSobel ... Sobel gradient - in X direction
% pathStart ... (x,y)-coordinates of the starting-point of the path
% imgGreen  ... marks the target-area; necessary for termination
% imgOri    ... original image
% 
% OUTPUT
% path ... the path out - sketched onto original image

path = imgOri;

% up=0, right=1, down=2, left=3
direction=0;

% count turns
counter=0;

% current position 
cursor=pathStart;

% Flags
walkStraightFlag=true;  % alongside a wall or straight
collisionFlag=false;    % is there a wall ahead
foundExitFlag=false;    % have we found the exit
wallEndedFlag=false;

%disp(imgBinary);
%uiwait;

status=0;
while(foundExitFlag~=true) 

    status=status+1;
    
    % move 'cursor' (detection-area) 1 px into current direction 
    [cursor, path] = pledgeCursorShift(cursor, path, direction);
    
    % did we hit a wall
    collisionFlag = pledgeDetectCollision(cursor, imgBinary, direction);
    
    % is there a wall that we should follow
    if(walkStraightFlag==false)
        wallEndedFlag = pledgeDetectWallEnded(cursor, imgBinary, direction);
    end

    % check if an exit was found
    if(pathEnd(1,1) < cursor(1,1) && cursor(1,1) < pathEnd(2,1))
        if(pathEnd(1,2) < cursor(1,2) && cursor(1,2) < pathEnd(2,2))
            foundExitFlag=true;
            disp('Exit found');
        end
    end
    
    [direction, counter, wallEndedFlag, collisionFlag, walkStraightFlag]=pledgeStrategy(direction, counter, wallEndedFlag, collisionFlag, walkStraightFlag);
    
    
    % output current status every 50px
    if(mod(status,70) == 0)
        imshow(path);
        pause(0.03);
        %uiwait;
        %if(status>2000)
        %    break;
        %end
    end
end


end