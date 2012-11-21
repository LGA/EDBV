function[resGrey] = highContrastGrey(input)

% optimizes the contrast in the greyscale to make 
% distinction between walls and corridors easier
%
% INPUT
% input     ... the greyscale-version of the original image (double)
%
% OUTPUT
% resGrey   ... the optimized greyscale-version


 % median filter
 input = medianFilter(input);

 input = input*256;
 input = uint8(input);

 % input = input(:,:,1);  
 [ m, n ] = size ( input );
  pic = zeros ( 8, m, n );
  
% set contrast Value
  contrastValue = 5;
  
  input = double ( input );

% get 8 neighbours
  pic(1,:,:) = circshift ( input, [ -1, -1 ] );
  pic(2,:,:) = circshift ( input, [ -1,  0 ] );
  pic(3,:,:) = circshift ( input, [ -1,  1 ] );
  pic(4,:,:) = circshift ( input, [  0, -1 ] );
  pic(5,:,:) = circshift ( input, [  0,  1 ] );
  pic(6,:,:) = circshift ( input, [  1, -1 ] );
  pic(7,:,:) = circshift ( input, [  1,  0 ] );
  pic(8,:,:) = circshift ( input, [  1,  1 ] );
  
% get average and convert to 2d
  average = sum ( pic ) / 8.0;
  Average2d(1:m,1:n) = average(1,1:m,1:n);

% calculate contrast
  contrastenhanced = ( 1.0 - contrastValue ) * Average2d(:,:) + contrastValue * input;
  contrastenhanced = uint8 ( contrastenhanced );

% set border Pixel to default  
  contrastenhanced(1,:) = input(1,:);
  contrastenhanced(m,:) = input(m,:);
  contrastenhanced(:,1) = input(:,1);
  contrastenhanced(:,n) = input(:,n);

  imshow(contrastenhanced);

    resGrey=contrastenhanced;
end