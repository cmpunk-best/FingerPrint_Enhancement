clear all
clc
% normalization
%% Gabor filter
wg=11;
[xgrid,ygrid]=meshgrid(-wg/2:wg/2,-wg/2:wg/2);

deltax=4;
deltay=4;

for i =1:row 
    for j=1:column
        x_theta = xgrid* cos(ofinal(i,j)) + ygrid* sin(ofinal(i,j));
        y_theta = -xgrid* sin(ofinal(i,j)) + ygrid* cos(ofinal(i,j));
        gabor = exp(-.5*(x_theta.^2./deltax^2+y_theta.^2./deltay^2)).*cos(2*pi*.25*ofinal(i,j));
        E=conv2(gabor,G);
    end
end

figure;
imshow(E);
