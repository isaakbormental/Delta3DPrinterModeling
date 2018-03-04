function J = Jacobian(pos, robot)

syms x y z l t_o R r
%% Inverse kinematics in symbolic form
q1 = z + t_o + sqrt(l^2 - (R-x-r)^2 - y^2)
q2 = z + t_o + sqrt(l^2 - (R*cosd(120)-x-r*cosd(120))^2 - (R*sind(120)-y-r*sind(120))^2)
q3 = z + t_o + sqrt(l^2 - (R*cosd(240)-x-r*cosd(240))^2 - (R*sind(240)-y-r*sind(240))^2)

J1_inv = [diff(q1,x) diff(q2,x) diff(q3,x) 0 0 0]'
J2_inv = [diff(q1,y) diff(q2,y) diff(q3,y) 0 0 0]'
J3_inv = [diff(q1,z) diff(q2,z) diff(q3,z) 0 0 0]'

J_inv = [simplify(J1_inv), simplify(J2_inv), simplify(J3_inv)]

%% Forward kinematics in symbolic form
[x,y,z] = solve([q1, q2, q3], [x y z]); % Leads to multiple solutions

syms q1 q2 q3
J1 = [diff(x(1),q3) diff(y(1),q1) diff(z(1),q1) 0 0 0]'
J2 = [diff(x(1),q2) diff(y(1),q2) diff(z(1),q2) 0 0 0]'
J3 = [diff(x(1),q3) diff(y(1),q3) diff(z(1),q3) 0 0 0]'

J = [simplify(J1), simplify(J2), simplify(J3)]

end