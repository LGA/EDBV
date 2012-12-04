function pathEnd =  findMazeExit(imgGreen)
% creates a 2x2 matrix - borders of the maze-exit 
% [x y; x y] ==> top-left; right-bottom
% 
% INPUT
% imgGreen ... G-channel of the image
%
% OUTPUT
% pathEnd  ... left-top and right-bottom coordinates of the exit



center = centroid(imgGreen);
pathEnd = [center; center];

%top-left
run=true;


% move from center to top until green ends
while(run)
    pathEnd(1,1)=pathEnd(1,1)-1;
    if((imgGreen(pathEnd(1,1), pathEnd(1,2)) == 0) || (pathEnd(1,1) == 1))
        break;
    end
end

% move from center to left-border until green ends
while(run)
    pathEnd(1,2)=pathEnd(1,2)-1;
    if((imgGreen(pathEnd(2,1), pathEnd(1,2)) == 0) || (pathEnd(1,2) == 1))
        break;
    end
end

pathEnd(2,2) = (2*pathEnd(2,2))-pathEnd(1,2);
pathEnd(2,1) = (2*pathEnd(2,1))-pathEnd(1,1);



end