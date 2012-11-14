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



resRed=input(:,:,1)-input(:,:,2);
resRed(:,:) = max(min(255,resRed(:,:)), 0);
resGreen=input(:,:,2)-input(:,:,1);
resGreen(:,:) = max(min(255,resGreen(:,:)), 0);
resBlue=input(:,:,3)-input(:,:,1);
resBlue(:,:) = max(min(255,resBlue(:,:)), 0);

center = centroid(resRed);
imshow(resRed);
hold on;
plot(center(2), center(1), 'o');
hold off;

uiwait;

resGrey = input;
resGrey = resGrey(:,:,1)*0.299+resGrey(:,:,2)*0.587+resGrey(:,:,3)*0.114;
pathStart=center;

end