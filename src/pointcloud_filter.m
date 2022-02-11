function [x_vector, y_vector, z_vector] = pointcloud_filter(points_vector, x_range, y_range, pose_center)

x_vector = points_vector(:, 1);
y_vector = points_vector(:, 2);
z_vector = points_vector(:, 3);

% filter by the range of x and y
x_mask = (x_vector < (pose_center(1)+x_range)) & (x_vector > (pose_center(1)-x_range));
y_mask = (y_vector < (pose_center(2)+y_range)) & (y_vector > (pose_center(2)-y_range));
total_mask = x_mask & y_mask;

% range filter
x_vector = x_vector(total_mask);
y_vector = y_vector(total_mask);
z_vector = z_vector(total_mask);

end

