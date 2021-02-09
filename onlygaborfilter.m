clear all
clc

image = imread('DB1_B/zebra.jpg');
image=rgb2gray(image);
sigma =2; 
theta = pi;
lamda = pi/4;
gamma=0.9 ;
phi = 0  ;
gb=gabor(sigma,theta,lamda,phi,gamma);
e=conv2(gb,image);
figure;
imshow(e);