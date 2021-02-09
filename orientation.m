clear all 
clc 

%Getting the G image 
normalization 

% =============================================================

%% Step 1 : Using Sobel operator to get gradient image

% xkernel = [1 0 -1 ;2 0 -2;1 0 -1];
% ykernel = xkernel';

% Gx =conv2(xkernel,G);
% Gy =conv2(ykernel,G);
[Gx Gy]= imgradientxy(G);
% G = sqrt(Gx.^2+Gy.^2);

% Orientation image 
 [row column]= size(fimage);
% 
% for i =1 : row 
%     for j=1:column
%       theta(i,j) = atan2(Gy(i,j),Gx(i,j));
%     end
% end
% 
% [x y] = meshgrid(1:column,1:row);
% m=flipud(theta);
% L=sqrt(1+m.^2);
% figure;
% quiver(x,y,1./L,m./L);
% figure;
% subplot(2,1,1);imshow(Gx);subplot(2,1,2);imshow(theta);

% ==============================================================
%% Step 2 : Local Orientation 
% Calculating V(i,j) where i,j represents the centered pixel for each block of 16*16

%  1. Slice G into sections of 16*16
%  2.take each sum and store in a matrix .
Gx=Gx(1:row,1:column);
Gy=Gy(1:row,1:column);
[row column]= size(Gx);
w=16;
steps_column = column/w;
steps_row = row/w;
for i =1:steps_row
    for j = 1:steps_column 
        [Vx(i,j) Vy(i,j)]= localV(Gx((i-1)*w+1:i*w,(j-1)*w+1:j*w),Gy((i-1)*w+1:i*w,(j-1)*w+1:j*w));
    end
end
% theta = 0.5*atan2(Vy,Vx);
% [trow tcol] = size(theta);
% [x y] = meshgrid(1:tcol,1:trow);

% figure;
% subplot(2,1,1);imshow(G);subplot(2,1,2);imshow(Gy);


%  Gxx = Vx.^2;       % Covariance data for the image gradients
%  Gxy = Vx.*Vy;
%  Gyy = Vy.^2;
 f=fspecial('gaussian',5,0.5);
%  Gxx=imfilter(Gxx,f);
%  Gxy=2*imfilter(Gxy,f);
%  Gyy=imfilter(Gyy,f);
% theta=0.5*atan2(2*Gxy,Gxx-Gyy);
theta = .5 * atan2(Vy,Vx);
m=flipud(theta);
L=sqrt(1+m.^2);
figure;
q1=quiver(1./L,m./L);
 q1.LineStyle= '-';
 q1.ShowArrowHead = 'off';
axis equal



% ===============================================================
%% Step 3 to do local filtering and find local orientation
phix=cos(2*theta);
phiy=sin(2*theta);

lowpasskernel=ones(5,5)*(1/25);
phixf=conv2(lowpasskernel,phix);
phiyf=conv2(lowpasskernel,phiy);
% phixf=imfilter(phix,f);
% phiyf=imfilter(phiy,f);
ofinal =.5*atan2(phiyf,phixf);
[orow ocolumn] = size(ofinal);
% [x y] = meshgrid(1:ocolumn,1:orow);
m=flipud(ofinal);
L=sqrt(1+m.^2);
figure;
quiver(1./L,m./L);
axis equal





