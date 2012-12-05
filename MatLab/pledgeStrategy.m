function [direction, counter, wallEndedFlag, collisionFlag, walkStraightFlag] = pledgeStrategy(direction, counter, wallEndedFlag, collisionFlag, walkStraightFlag)
% Decides in which direction to walk next
% 
% INPUT
% direction      ... top, left, bottom, right
% counter        ... number of turns
% wallEndedFlag  ... boolean - wall ended
% collisionFlag  ... boolean - wall ahead

% OUTPUT
% equals INPUT

        if(counter==0)
            walkStraightFlag=true;
        end

% wall hit, just turn right
if(collisionFlag==true)

    walkStraightFlag=false;
    
    collisionFlag=false;
    direction = mod(direction+1,4);
    counter=counter+1;
    
    disp('== Collision detected == new direction is: ');
    disp(direction);
    
    
% wall ended - turn or keep heading
else
    if(wallEndedFlag==true)
        
        disp('== Wall ended ==');
        
        wallEndedFlag=false;
        counter=counter-1;
        
            
        if(direction==0)
            direction=3;
        else
            direction=direction-1;
        end
        

        
        
        %{
        switch direction
            case 0
                
            case 1
                
            case 2
                
            case 3
        end
        %}
    end
end

end