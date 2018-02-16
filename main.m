clc; close; clear;
% forwardKinematics(5)

robot.r = 0.1; % radius of moving platform
robot.tool_offset = 0; % End-tool offset from moving platform
robot.R = 0.25; % radius of base platform
robot.l = 0.3; % length of arm
robot.shaft = 0.5; % shaft length

pos = [0;0;0];
q = IK(pos,robot);

%% Simulation
r = 0.05; % Circular trajectory radius [m]
w = 0.4*pi; % Circular trajectory angular speed in [rad/s]

pz = 0.1; % Height [m]
fps = 25; % How smooth animation will appear

simulate;