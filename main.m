clc
clear all
[edge_left,edge_right] = detect_vertices();
[half_plane] = calculate_half_plane(edge_left, edge_right);
