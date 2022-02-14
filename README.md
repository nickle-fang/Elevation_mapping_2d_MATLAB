This is a project for generating a local grip map from 2d lidar sensors.

# Sensor data

In this project, we need 2d lidar sensor data and the odometry infomation as input. For convenience, we generate 2d lidar sensor data from 3d one. We use [kitti](http://www.cvlibs.net/datasets/kitti/) dataset in this project. 

- **Lidar Sensor Data**

  We generate 2d lidar data from 3d one. When reading a 3d pcd file, we first pick the points on the center line of lidar and regard it as the output of a 2d lidar sensor.

- **Odometry Data**

  We use the ground truth data in kitti as the odometry data.

# Output

The output of this project is the 2d grid map.

![](./imgs/result.gif)