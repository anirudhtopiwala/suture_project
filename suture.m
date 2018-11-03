main = imread('pic.jpg');
main_bw=im2bw(main);
se = strel('line',4,4);
main_bw = imerode(main_bw,se);
main_edge = edge(main_bw,'canny');
points = detectHarrisFeatures(main_bw);
imshow(main)
hold on
plot(C(:,1),C(:,2),'r*');