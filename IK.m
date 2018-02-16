function q = IK(pos,robot)
    
    a1x = pos(1) + robot.r;
    a1y = pos(2);
    a1z = pos(3) + robot.tool_offset;
    
    b1x = pos(1) + robot.r*cosd(120);
    b1y = pos(2) + robot.r*sind(120);
    b1z = pos(3) + robot.tool_offset;
    
    c1x = pos(1) + robot.r*cosd(240);
    c1y = pos(2) + robot.r*sind(240);
    c1z = pos(3) + robot.tool_offset;
    
    a2x = robot.R;
    a2y = 0;
    
    b2x = robot.R*cosd(120);
    b2y = robot.R*sind(120);
    
    c2x = robot.R*cosd(240);
    c2y = robot.R*sind(240);
    
    aa = sqrt((a2x-a1x)*(a2x-a1x) + (a2y-a1y)*(a2y-a1y));
    ab = sqrt((b2x-b1x)*(b2x-b1x) + (b2y-b1y)*(b2y-b1y));
    ac = sqrt((c2x-c1x)*(c2x-c1x) + (c2y-c1y)*(c2y-c1y));
    
    ha = sqrt((robot.l*robot.l) - (aa*aa));
    hb = sqrt((robot.l*robot.l) - (ab*ab));
    hc = sqrt((robot.l*robot.l) - (ac*ac));
    
    a2z = pos(3) + robot.tool_offset + ha;
    b2z = pos(3) + robot.tool_offset + hb;
    c2z = pos(3) + robot.tool_offset + hc;
    
    q = [a2z; b2z; c2z];
    
end
