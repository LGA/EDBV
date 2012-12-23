function[resY, resX] = sobelGradient(input)

% calculates the sobal-gradient in x and y-direction
%
% INPUT
% input     ... optimized greyscale-image
%
% OUTPUT    
% resY      ... sobel gradien in y-direction
% resX      ... sobel gradien in x-direction

Gx=[-1  0  1; -2  0  2; -1  0  1];
Gy=[-1 -2 -1;  0  0  0;  1  2  1];

inputD = im2double(input);

resY=convolution(inputD, Gy);
resX=convolution(inputD, Gx);


end