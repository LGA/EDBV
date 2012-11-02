% contains all calls to further functionality
% -> is the entry-point to the processing pipeline

function main()


% clear output, read the inputfile and create the outputfile
close all;
clear global;
clc;

fileTypes = {'*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' };

[FileName,PathName] = uigetfile(fileTypes, 'File Selector');


disp(['Try to open file: ' PathName FileName])
imgOri = imread([PathName FileName]);
imgPath = imgOri;


% split color-channels (R, G, Grey) and find path-start
[imgRed, imgGreen, imgGrey, pathStart] = splitChannels(imgOri);


% optimize greyscale-image
[imgGrey] = highContrastGrey(imgGrey);


% create binary-image
[imgBinary] = binaryImage(imgGrey);


% sobel
[imgYSobel imgXSobel] = sobelGradient(imgGrey);


% plegde -> finding the actual way
[imgPath] = pledgePath(imgBinary, imgYSobel, imgXSobel, pathStart, imgGreen, imgOri);


% output of the result
subplot(1,2,1);
imshow(imgOri);
title('ORIGINAL');

subplot(1,2,2);
imshow(imgPath);
title('WITH PATH');

end