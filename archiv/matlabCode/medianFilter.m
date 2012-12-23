function [ output ] = medianFilter( input )
% applies the median filter
%
% INPUT
% input     ... greyscale-image
%
% OUTPUT    
% output    ... filtered image

% get neighbouring values
  pic(1,:,:) = circshift ( input, [ -1, -1 ] );
  pic(2,:,:) = circshift ( input, [ -1,  0 ] );
  pic(3,:,:) = circshift ( input, [ -1,  1 ] );
  pic(4,:,:) = circshift ( input, [  0, -1 ] );
  pic(5,:,:) = circshift ( input, [  0,  1 ] );
  pic(6,:,:) = circshift ( input, [  1, -1 ] );
  pic(7,:,:) = circshift ( input, [  1,  0 ] );
  pic(8,:,:) = circshift ( input, [  1,  1 ] );
  pic(9,:,:) = circshift ( input, [  0,  0 ] );
  
  
% calculate median
    D=median(pic,1);
    
    output = squeeze(D);
    
   % imshow(output);

end

