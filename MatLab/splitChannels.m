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

si = size(input);
output = zeros(si(1),si(2));
for i = 1:si(1)
    for j = 1:si(2)
        if(input(i, j, 1) > input(i, j, 2)+0.14 && input(i, j, 1) > input(i, j, 3)+0.14)
            output(i,j) = 255;
        end
    end
end

resRed=output;
imshow(output);
uiwait;
output = zeros(si(1),si(2));
for i = 1:si(1)
    for j = 1:si(2)
        if(input(i, j, 2) > input(i, j, 1)+0.14 && input(i, j, 2) > input(i, j, 3)+0.14)
            output(i,j) = 255;
        end
    end
end
resGreen=output;

center = centroid(resRed);
imshow(output);
hold on;
plot(center(2), center(1), 'o');
hold off;
uiwait;


resGrey = input;
resGrey = max(max(resGrey(:,:,1), resGrey(:,:,2)),resGrey(:,:,3));

pathStart=center;

end