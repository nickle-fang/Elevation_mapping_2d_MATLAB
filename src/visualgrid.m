function [] = visualgrid (grid, center)
    %创建具有障碍物的栅格地图
    %矩阵中0代表黑色栅格
    a = grid';

    % display
    b = a;
    b(end+1,end+1) = 0;
    colormap([0 0 0;1 1 1]);  % 创建颜色
    pcolor(0.5+center(1):1:size(a,2)+0.5+center(1), ...
        0.5+center(2):1:size(a,1)+0.5+center(2), b); % 赋予栅格颜色
    % set(gca,'XTick',1:size(a,1),'YTick',1:size(a,2));  % 设置坐标
    axis image xy;  % 沿每个坐标轴使用相同的数据单位，保持一致

end

