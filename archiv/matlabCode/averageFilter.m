function[output] = averageFilter(input)

% average filter on input image
%
% INPUT
% input     ... greyscale-image
%
% OUTPUT    
% output      ... filtered Image

Filter=[0.1111  0.1111  0.1111; 0.1111  0.1111  0.1111; 0.1111  0.1111  0.1111];

inputD = im2double(input);

output = convolution(inputD, Filter);



end
