function [point1_trans,point2_trans,point3_trans,point4_trans] = drone(phi,theta,psai)
Cbn = [cos(psai)*cos(theta),cos(psai)*sin(theta)*sin(phi)-sin(psai)*cos(phi),...
    sin(theta)*cos(phi)*cos(psai)+sin(phi)*sin(psai);...
    sin(psai)*cos(theta),cos(phi)*cos(psai)+sin(phi)*sin(theta)*sin(psai),...
    sin(theta)*cos(phi)*sin(psai)-sin(phi)*cos(psai);...
    -sin(theta),cos(theta)*sin(phi),cos(theta)*cos(phi)
    ];

x0 = 0; y0 = 0; z0 = 0;
point1 = [x0-1,y0,z0]; point2 = [x0+1,y0,z0];
point3 = [x0,y0-1,z0]; point4 = [x0,y0+1,z0];
point1_trans = Cbn*point1';point2_trans = Cbn*point2';
point3_trans = Cbn*point3';point4_trans = Cbn*point4';
end