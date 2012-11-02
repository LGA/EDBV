function [path] = pledgePath(imgBinary, imgYSobel, imgXSobel, pathStart, imgGreen, imgOri)
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

end