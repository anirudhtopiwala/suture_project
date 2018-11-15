function [coeffs] = calculate_half_plane(edge_left, edge_right)
x=[edge_left(1) edge_right(1)];
y=[edge_left(2) edge_right(2)];
coeffs = polyfit(x,y,1);
end
