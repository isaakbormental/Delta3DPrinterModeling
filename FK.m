function pos = FK(q,robot)

syms x y z l t_o R r
%% Inverse kinematics in symbolic form
q1 = z + t_o + sqrt(l^2 - (R-x-r)^2 - y^2)
q2 = z + t_o + sqrt(l^2 - (R*cosd(120)-x-r*cosd(120))^2 - (R*sind(120)-y-r*sind(120))^2)
q3 = z + t_o + sqrt(l^2 - (R*cosd(240)-x-r*cosd(240))^2 - (R*sind(240)-y-r*sind(240))^2)

% Solving for x y z
[x,y,z] = solve([q1, q2, q3], [x y z]); % Leads to multiple solutions

% Transform from symbolic to numeric
pos(1) = 0;
pos(2) = 0;
pos(3) = sqrt((robot.R + robot.l - robot.r)*(robot.l - robot.R + robot.r)) - robot.tool_offset;

end

