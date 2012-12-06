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
        if(input(i, j, 1) > input(i, j, 2)+35 && input(i, j, 1) > input(i, j, 3)+35)
            output(i,j) = 255;
        end
    end
end

resRed=output;
output = zeros(si(1),si(2));
for i = 1:si(1)
    for j = 1:si(2)
        if(input(i, j, 2) > input(i, j, 1)+35 && input(i, j, 2) > input(i, j, 3)+35)
            output(i,j) = 255;
        end
    end
end
resGreen=output;

pos = [350, 378];
finished(resGreen, pos)

center = centroid(resRed);
imshow(output);
hold on;
plot(center(2), center(1), 'o');
plot(pos(2), pos(1), 'o');
hold off;

uiwait;

resGrey = input;
resGrey = resGrey(:,:,1)*0.299+resGrey(:,:,2)*0.587+resGrey(:,:,3)*0.114;
pathStart=center;

end