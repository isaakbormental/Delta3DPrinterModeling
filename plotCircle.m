function [] = plotCircle(xc, yc, zc, rad, color)

    [x, y] = cylinder(rad,100);
    plot3(x(1,:)+xc,y(1,:)+yc,repmat(zc,size(x)), 'Color', color, 'LineWidth', 5)

end