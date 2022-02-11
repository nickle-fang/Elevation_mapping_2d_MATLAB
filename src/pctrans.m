function [points_vector, pose_center] = pctrans(points_vector, gt_pose_i)

% transforme matrix
% Pose_camera = Tr * Pose_lidar
Tr = [4.276802385584e-04, -9.999672484946e-01, -8.084491683471e-03, -1.198459927713e-02;
     -7.210626507497e-03, 8.081198471645e-03,  -9.999413164504e-01, -5.403984729748e-02;
      9.999738645903e-01, 4.859485810390e-04,  -7.206933692422e-03, -2.921968648686e-01;
      0,                  0,                   0,                   1                 ];
  
Tz = [1, 0, 0, 0;
      0, 0, 1, 0;
      0,-1, 0, 0;
      0, 0, 0, 1];
  
gt_pose_i = reshape(gt_pose_i, [4,3]);
gt_pose_i = gt_pose_i';
row_ones = [0,0,0,1];
gt_pose_i = [gt_pose_i; row_ones];

% handle the transformation and rotation
total_transform_matrix = Tz * gt_pose_i * Tr;
points_vector = total_transform_matrix * points_vector';
points_vector = points_vector';

pose_center = [total_transform_matrix(1,4), total_transform_matrix(2,4)];

end