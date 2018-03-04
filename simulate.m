% Shafts
a2x = robot.R;
a2y = 0;

b2x = robot.R*cosd(120);
b2y = robot.R*sind(120);

c2x = robot.R*cosd(240);
c2y = robot.R*sind(240);

shaft_s = [
    a2x a2y 0;
    b2x b2y 0;
    c2x c2y 0;
    ]';

shaft_e = [
    a2x a2y robot.shaft;
    b2x b2y robot.shaft;
    c2x c2y robot.shaft;
    ]';

for i = 0:1/fps:5 % Timestamps
    
    % Bottom plate:
    plotCircle(0, 0, 0, robot.R, [1 0.6 0]); 
    hold on;
    grid on;
    % Top plate:
    plotCircle(0, 0, robot.shaft, robot.R, [1 0.6 0]); 
    
    % 3 Shafts:
    plot3([shaft_s(1,1) shaft_e(1,1)],[shaft_s(2,1) shaft_e(2,1)], [shaft_s(3,1) shaft_e(3,1)], 'g', 'LineWidth', 5);
    plot3([shaft_s(1,2) shaft_e(1,2)],[shaft_s(2,2) shaft_e(2,2)], [shaft_s(3,2) shaft_e(3,2)], 'g', 'LineWidth', 5);
    plot3([shaft_s(1,3) shaft_e(1,3)],[shaft_s(2,3) shaft_e(2,3)], [shaft_s(3,3) shaft_e(3,3)], 'g', 'LineWidth', 5);

    % Transition of top platform through time:
    px = r*cos(w*i);
    py = r*sin(w*i);
    
    % Moving plate of end-effector:
    plotCircle(px, py, pz+robot.tool_offset, robot.r, [0 0 1]);
    
    % Links:
    a1x = px + robot.r;
    a1y = py;
    a1z = pz + robot.tool_offset;

    b1x = px + robot.r*cosd(120);
    b1y = py + robot.r*sind(120);
    b1z = pz + robot.tool_offset;

    c1x = px + robot.r*cosd(240);
    c1y = py + robot.r*sind(240);
    c1z = pz + robot.tool_offset;

    aa = sqrt((a2x-a1x)*(a2x-a1x) + (a2y-a1y)*(a2y-a1y));
    ab = sqrt((b2x-b1x)*(b2x-b1x) + (b2y-b1y)*(b2y-b1y));
    ac = sqrt((c2x-c1x)*(c2x-c1x) + (c2y-c1y)*(c2y-c1y));

    ha = sqrt((robot.l*robot.l) - (aa*aa));
    hb = sqrt((robot.l*robot.l) - (ab*ab));
    hc = sqrt((robot.l*robot.l) - (ac*ac));

    a2z = pz + robot.tool_offset + ha;
    b2z = pz + robot.tool_offset + hb;
    c2z = pz + robot.tool_offset + hc;

    link_s = [
        a2x a2y a2z;
        b2x b2y b2z;
        c2x c2y c2z;
        ]';

    link_e = [
        a1x a1y a1z;
        b1x b1y b1z;
        c1x c1y c1z;
        ]';

    % 3 links:
    plot3([link_s(1,1) link_e(1,1)],[link_s(2,1) link_e(2,1)], [link_s(3,1) link_e(3,1)], 'r', 'LineWidth', 5);
    plot3([link_s(1,2) link_e(1,2)],[link_s(2,2) link_e(2,2)], [link_s(3,2) link_e(3,2)], 'r', 'LineWidth', 5);
    plot3([link_s(1,3) link_e(1,3)],[link_s(2,3) link_e(2,3)], [link_s(3,3) link_e(3,3)], 'r', 'LineWidth', 5);
    
    % Connection points on shafts and moving platform:
    scatter3([a2x b2x c2x], [a2y b2y c2y], [a2z b2z c2z], [100, 100, 100], [0,0,0], 'filled');
    scatter3([a1x b1x c1x], [a1y b1y c1y], [a1z b1z c1z], [100, 100, 100], [0,0,0], 'filled');
    
    % End-effector:
    scatter3(px, py, pz, 50, 'filled');

    hold off;
    pause(1/fps);
    
end