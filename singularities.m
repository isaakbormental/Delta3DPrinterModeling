
map = [];
for i = -robot.shaft:0.01:robot.shaft
    for j = -robot.shaft:0.01:robot.shaft
        for k = 0:0.01:robot.shaft
            q = IK([i,j,k],robot);
            if isreal(q)
                map = [map [i,j,k]'];
            end
        end
    end
end

scatter3(map(1,:), map(2,:), map(3,:))
grid on