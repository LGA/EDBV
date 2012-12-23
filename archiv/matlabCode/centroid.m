function[resVec] = centroid(input)

% calculates centroid after gray to binary conversion
%
% INPUT
% input     ... 1 channel image
%
% OUTPUT    
% resVec      ... centroid position

input = im2bw(input);
input = input * 255;
input = im2double(input);

m00 = 0.0;
m10 = 0.0;
m01 = 0.0;

[sizeX, sizeY] = size(input);

for x=1:sizeX
    for y=1:sizeY
       m00 = m00 + input(x,y);
       m10 = m10 + x * input(x,y);
       m01 = m01 + y * input(x,y);
    end    
end

resVec = [int64(m10/m00), int64(m01/m00)];
end