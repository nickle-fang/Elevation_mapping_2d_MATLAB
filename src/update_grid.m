function [show_grid, new_grid] = update_grid(x_vector, y_vector, x_range, y_range, ...
    grid_resolution, obstacle_swell, pose_center, old_show_grid, old_pose_center)

    xgrid_num = round(x_range*2/grid_resolution);
    ygrid_num = round(y_range*2/grid_resolution);

    % calculater the grid move number
    x_grid_move = round((pose_center(1) - old_pose_center(1)) / grid_resolution);
    y_grid_move = round((pose_center(2) - old_pose_center(2)) / grid_resolution);
    
    % draw the grid map
    show_grid = ones(xgrid_num, ygrid_num);
    new_grid = ones(xgrid_num, ygrid_num);
    
    for xi = 1:xgrid_num
        for yi = 1:ygrid_num
            grid_x_min = pose_center(1) - x_range + (xi-1)*grid_resolution;
            grid_x_max = grid_x_min + grid_resolution;
            grid_y_min = pose_center(2) - y_range + (yi-1)*grid_resolution;
            grid_y_max = grid_y_min + grid_resolution;
            point_mask = (x_vector>grid_x_min-obstacle_swell) & (x_vector<grid_x_max+obstacle_swell)...
                & (y_vector>grid_y_min+obstacle_swell) & (y_vector<grid_y_max+obstacle_swell);
            if sum(point_mask) > 0
                show_grid(xi, yi) = 0;
                new_grid(xi, yi) = 0;
            else
                % use old data
                if (xi + x_grid_move > 0) && (xi + x_grid_move <= xgrid_num) ...
                   && (yi + y_grid_move > 0) && (yi + y_grid_move <= ygrid_num)
               
                    show_grid(xi, yi) = old_show_grid(xi + x_grid_move, yi + y_grid_move);
                end
            end
        end
    end
end
