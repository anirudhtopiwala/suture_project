clc;clear all; close all;
main = imread('pic.jpg');
main_bw=im2bw(main);
se = strel('line',4,4);
main_bw = imerode(main_bw,se);
main_edge = edge(main_bw,'sobel');
main_edge=bwmorph(main_edge,'thicken');
main_edge =imfill( main_edge, 'holes' );
main_edge=bwmorph(main_edge,'thicken');
main_edge =imfill( main_edge, 'holes' );
s = regionprops(main_bw,{...
    'Centroid',...
    'MajorAxisLength',...
    'MinorAxisLength',...
    'Orientation'});
figure
imshow(main_edge);s.Centroid(1)
C = detectHarrisFeatures(main_edge,'MinQuality',0.5);
c= C.Location;
hold on
plot(s.Centroid(1),s.Centroid(2),'r*');
edge_right(1)=(s.Centroid(1)+sind(s.Orientation)*s.MajorAxisLength/4);
edge_right(2)=s.Centroid(2)+cosd(s.Orientation)*s.MajorAxisLength/4;
edge_left(1)=(s.Centroid(1)-sind(s.Orientation)*s.MajorAxisLength/4);
edge_left(2)=s.Centroid(2)+cosd(s.Orientation)*s.MajorAxisLength/4;
hold on
plot(edge_right(1),edge_right(2),'g*');
plot(edge_left(1),edge_left(2),'b*');