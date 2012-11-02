function[resRed, resGreen, resGrey, pathStart] = splitChannels(input)

% Splits the red and green channel, creates a greyscale and
% finds the starting-point from the original image
% 
% INPUT
% input ... original image
% 
% OUTPUT
% resRed    ... red channel
% resGreen  ... green channel
% resGrey   ... greyscale image
% pathStart ... (x,y)-coordinates of the starting-point


resRed=input;
resGreen=input;
resGrey=input;
pathStart=[1 1];

end