% LALAL TODO: Define robot structure
% Init commit

% forwardKinematics(5)

robot.r = 0.1; % radius of moving platform
robot.tool_offset = 0; % End-tool offset from moving platform
robot.R = 0.25; % radius of base platform
robot.l = 0.3; % length of arm

pos = [0;0;0];
q = IK(pos,robot);