clear all;
clc;

% =======================================================
%% Normalization of Image to 100(uint8) or 100/255(double) mean and 100(uint8) or 100/255(double) variance

%Loading image from database
fimage2= imread('DB1_B/105_2.tif');

%Calculating the mean
fimage = im2double(fimage2); %converting to double to use mathematical operators like sqrt
fimage_sum= sum(sum(fimage),2);
fimage_mean= fimage_sum/numel(fimage);

%Calculating the variance

image_diff = fimage - fimage_mean;

image_diff_sq= image_diff.^2;

image_diffsum = sum(sum(image_diff_sq),2);
fimage_variance = image_diffsum / numel(fimage);

formatspec= 'The mean and variance are %d and %d ';
sprintf(formatspec,fimage_mean,fimage_variance)

%Normalizing 

[row column]= size(fimage);
M0= 100/255; %desired Mean
V0= 100/255; %desired Variance
for i =1 : row 
    for j=1:column
       if (fimage(i,j) > fimage_mean)
           G(i,j)= M0 + sqrt((V0*(fimage(i,j)-fimage_mean)^2)/fimage_variance);
       else
           G(i,j)= M0 - sqrt((V0*(fimage(i,j)-fimage_mean)^2)/fimage_variance);
       end
    end
end

% figure;
% imshow(G)

%===========================================================








