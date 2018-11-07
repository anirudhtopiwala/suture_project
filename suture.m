clc;clear all; close all;
main = imread('pic.jpg');
main_bw=im2bw(main);
se = strel('line',4,4);
main_bw = imerode(main_bw,se);
main_edge = edge(main_bw,'sobel');
main_edge =imfill( main_edge, 'holes' );
figure
imshow(main_edge);
C = detectHarrisFeatures(main_edge,'MinQuality',0.5);
c= C.Location;
hold on
plot(c(:,1),c(:,2),'r*');