function [filtered_grid] = ray_tracing(new_grid, show_grid)

    % max size of obstacles
    obs_grid_size = 10;

    % analysis every obstacle in new grid
    [row, colume] = find(new_grid==0);
    grid_center = round(size(new_grid)/2);
    
    filtered_grid = show_grid;
    
    for obs_i=1:size(row)
        
       if colume(obs_i) ==  grid_center(2)
           if row(obs_i) > grid_center(1)
               filtered_grid(grid_center(1):row(obs_i)-obs_grid_size, grid_center(2)) = 1;
               filtered_grid(grid_center(1):row(obs_i)-obs_grid_size, grid_center(2)-1) = 1;
               filtered_grid(grid_center(1):row(obs_i)-obs_grid_size, grid_center(2)+1) = 1;
           else
               filtered_grid(row(obs_i)+obs_grid_size:grid_center(1), grid_center(2)) = 1;
               filtered_grid(row(obs_i)+obs_grid_size:grid_center(1), grid_center(2)-1) = 1;
               filtered_grid(row(obs_i)+obs_grid_size:grid_center(1), grid_center(2)+1) = 1;
           end
       end
       
       if row(obs_i) == grid_center(1)
           if colume(obs_i) > grid_center(2)
               filtered_grid(grid_center(1), grid_center(2):colume(obs_i)-obs_grid_size) = 1;
               filtered_grid(grid_center(1)-1, grid_center(2):colume(obs_i)-obs_grid_size) = 1;
               filtered_grid(grid_center(1)+1, grid_center(2):colume(obs_i)-obs_grid_size) = 1;
           else
               filtered_grid(grid_center(1), colume(obs_i)+obs_grid_size:grid_center(2)) = 1;
               filtered_grid(grid_center(1)-1, colume(obs_i)+obs_grid_size:grid_center(2)) = 1;
               filtered_grid(grid_center(1)+1, colume(obs_i)+obs_grid_size:grid_center(2)) = 1;
           end
       end
       
       if (row(obs_i) ~= grid_center(1)) && (colume(obs_i) ~=  grid_center(2))
           k = (grid_center(1) - row(obs_i)) / (grid_center(2) - colume(obs_i));
           if colume(obs_i) > grid_center(2)
               for obs_j = grid_center(2):colume(obs_i)-obs_grid_size
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1))-1, obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1))+1, obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j-1) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j+1) = 1;
               end
           else
               for obs_j = colume(obs_i)+obs_grid_size:grid_center(2)
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1))-1, obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1))+1, obs_j) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j-1) = 1;
                   filtered_grid(round(k*(obs_j-grid_center(2))+grid_center(1)), obs_j+1) = 1;
               end               
           end
       end  
    end
    
end