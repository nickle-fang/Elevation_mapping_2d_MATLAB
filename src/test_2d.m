% clear the workspace
clear
clc

% config
x_range = 15; % 10*2
y_range = 15; % 10*2
obstacle_swell = 0.0;
grid_resolution = 0.3;
xgrid_num = round(x_range*2/grid_resolution);
ygrid_num = round(y_range*2/grid_resolution);

gt_pose = load("~/Desktop/MATLAB_SLAM/Elevation_Mapping_MATLAB/kitti_gt/data_odometry_poses/dataset/poses/00.txt");
for lidar_frame_i = 1:960
    points_vector = read_pcd("~/Desktop/MATLAB_SLAM/Elevation_Mapping_MATLAB/kitti_gt/00_kitti_pcd", lidar_frame_i);
    gt_pose_i = gt_pose(lidar_frame_i,:);
    [points_vector, pose_center] = pctrans(points_vector, gt_pose_i);
    
    % filter the pointcloud
    [x_vector, y_vector, z_vector] = pointcloud_filter(points_vector, x_range, y_range, pose_center);
    
    if lidar_frame_i == 1
        old_pose_center = [0, 0];
        old_show_grid = ones(xgrid_num, ygrid_num);
    end
    
    [show_grid, new_grid] = update_grid(x_vector, y_vector, x_range, y_range, ...
                              grid_resolution, obstacle_swell, pose_center, old_show_grid, old_pose_center);
    
    % ray tracing to del dynamic obstacles
    filtered_grid = ray_tracing(new_grid, show_grid);
    
    old_pose_center = pose_center;
    old_show_grid = filtered_grid;
    
    % visualization
    visualgrid(filtered_grid, pose_center, lidar_frame_i);
    pause(0.01);
end

