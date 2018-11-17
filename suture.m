clc;clear all; close all;
%% 
% main = imread('pic.jpg');
main = imread('orientedellipse.jpg');

main_bw=imbinarize(rgb2gray(main));
main_comp = bwareafilt(imfill(imcomplement(main_bw),'holes'),1);
imshow(main)
B = bwboundaries(main_comp);
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2,'Color','r')
   break
end

s = regionprops(main_comp,{...
    'Centroid',...
    'MajorAxisLength',...
    'MinorAxisLength',...
    'Orientation'});
centroids = cat(1, s.Centroid);
majoraxis = cat(1, s.MajorAxisLength);
minoraxis = cat(1, s.MinorAxisLength);
Orientations = cat(1, s.Orientation);
hold on
plot(centroids(1,1), centroids(1,2), 'b*','LineWidth', 5);
grid on

% s.Centroid(1)
% C = detectHarrisFeatures(main_edge,'MinQuality',0.5);
% c= C.Location;
% hold on
x2=(centroids(1,1)+cosd(Orientations(1))*majoraxis(1)/2);
y2=centroids(1,2)-sind(Orientations(1))*majoraxis(1)/2;
x1=(centroids(1,1)-cosd(Orientations(1))*majoraxis(1)/2);
y1=centroids(1,2)+sind(Orientations(1))*majoraxis(1)/2;

%% Right Point
plot(x2,y2,'b*','LineWidth', 5);
%% Left Point
plot(x1,y1,'b*','LineWidth', 5);

%% Getting the Major Axis line
m = (y2-y1)/(x2-x1);
%% Equation of the line
% y - mx = y1 -mx1
k =1 ; l=1;
for i=1:length(boundary)
    if(( boundary(i,1) - m*(boundary(i,2)) - y1 + m*x1)< 0) 
        upperhalf(k,1) = boundary(i,2);
        upperhalf(k,2) = boundary(i,1);
        k=k+1;
    else
        lowerhalf(l,1) = boundary(i,2);
        lowerhalf(l,2) = boundary(i,1);
        l=l+1;
    end
end
upperhalf = sortrows(upperhalf);
lowerhalf = sortrows(lowerhalf);
%% Plotting Upper and Lower Half
for i =1:1000
plot(upperhalf(i,1),upperhalf(i,2),'y*');
plot(lowerhalf(i,1),lowerhalf(i,2),'g*');
pause(0.01);
end
% the corresponding points are in upperhalf and lowerhalf arrays

