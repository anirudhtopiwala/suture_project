clc
clear all
[edge_left,edge_right] = detect_vertices();
[half_plane] = calculate_half_plane(edge_left, edge_right);
[im_top_half] = get_top_half_corners(half_plane);
[im_bottom_half] = get_bottom_half_corners(half_plane);