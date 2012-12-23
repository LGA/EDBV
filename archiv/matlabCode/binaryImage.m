function[imgBinary] = binaryImage(input)
% creates a binary from optimized greyscale-image
% 
% INPUT
% input     ... greyscale image
%
% OUTPUT
% imgBinary ... binary image

    % create a 0-filled matrix in the size of the image
    imgBinary=zeros(size(input));
    threshold=goodThreshold(input);
    
    % set all cells greate than the threshold to 1
    imgBinary(input > threshold) = 1;

end