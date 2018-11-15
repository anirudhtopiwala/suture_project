function [im_bottom_half] = get_bottom_half_corners(half_plane)
main = imread('pic.jpg');
main_bw=im2bw(main);
imshow(main_bw)
imshow(main_bw);

se = strel('line',4,4);
main_bw = imerode(main_bw,se);
main_edge = edge(main_bw,'sobel');
imshow(main_edge)
main_edge=bwmorph(main_edge,'thicken');
main_edge =imfill( main_edge, 'holes' );
main_edge=bwmorph(main_edge,'thicken');
main_edge =imfill( main_edge, 'holes' );

for i = 1:1:size(main,1)
    for j = 1:1:size(main,2)
        if(i<(j*half_plane(1)+half_plane(2)))
            main_edge(i,j)=0;
        end
    end
end

figure
imshow(main_edge)

im_bottom_half = main_edge;

end
