function[finished] = finished(greenimage, position)

% Checks if the current position is sourrounded by green pixels
% 
% INPUT
% greenimage ... separated green b/w image
% position ... current position
% 
% OUTPUT
% finished    ... true if finished.


finished = true;

for i= -1:1
    for j=-1:1
        if(greenimage(position(1)+i, position(2)+j) == 0)
            finished = false;
        end
    end
end

end