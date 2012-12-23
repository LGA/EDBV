function [ histeqimage ] = histogramequalization( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

input = 256* input;
input = uint8(input);

[x,y] = size(input);

pixelcount = x*y;
histeqimage = uint8(zeros(x,y));
count = zeros(256);


for i=1:size(input,1)

    for j=1:size(input,2)

        value=input(i,j);
% count occurrences of pixel values
        count(value+1)=count(value+1)+1;
       

    end

end

h = zeros(256);
cdf = zeros(256);
total=0;

for i=1:256

%calculate cumulative distribution function
   total=total+count(i);
   cdf(i)=total;
   
%general histogram equalization

   h(i)=round(cdf(i)/pixelcount*255);
  
   
end


for i=1:size(input,1)

    for j=1:size(input,2)

      histeqimage(i,j)=h(input(i,j)+1);

    end

end
     
histeqimage = im2double(histeqimage);

end

