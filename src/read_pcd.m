function [points_vector] = read_pcd(pcd_dir, i)

pcd_files_list = {dir(pcd_dir)};
file_path = strcat(pcd_dir, "/", pcd_files_list{1}(i+2).name);
ptCloud = pcread(file_path);

% get the single line of 3d pointcloud
plocation = ptCloud.Location();
mask = ((plocation(:, 3) - 0) < 1e-3) & ((plocation(:, 3) - 0) > -1e-3);
single_line_location = plocation(mask, :);
single_line_location(:, 3) = 0;
% singlept = pointCloud(single_line_location);
% figure
% pcshow(singlept);

points_vector = single_line_location;

sizeof_points_vector = size(points_vector);
point_ones = ones(sizeof_points_vector(1), 1);
points_vector = [points_vector, point_ones];

end

