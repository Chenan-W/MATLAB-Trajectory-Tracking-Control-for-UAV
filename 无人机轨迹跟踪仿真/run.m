%仿真轨迹与绘制
clf
len = length(tout);
xmax = 0; ymax = 0; zmax = 0;
xmin = 0; ymin = 0; zmin = 0;
for i = 1:len
    figure(1);
    if(x(i)>=xmax)
        xmax = x(i);
    end
    if(y(i)>=ymax)
        ymax = y(i);
    end
    if(z(i)>=zmax)
        zmax = z(i);
    end
    if(x(i)<=xmin)
        xmin = x(i);
    end
    if(y(i)<=ymin)
        ymin = y(i);
    end
    if(z(i)<=zmin)
        zmin = z(i);
    end
    limitmin = min(xmin,ymin); limitmax = max(xmax,ymax);
    xlim([limitmin-2,limitmax+2]),ylim([limitmin-2,limitmax+2]),zlim([-1,zmax+5])
    grid on;
    
    [point1_trans,point2_trans,point3_trans,point4_trans]=drone(phi(i),theta(i),psai(i));%绘制四旋翼
    try
        delete(h1);delete(h2);delete(point);
        plot3([x(i-1),x(i)],[y(i-1),y(i)],[z(i-1),z(i)],"LineWidth",2)
    catch
    end
    h1 = plot3([x(i)+point1_trans(1),x(i)+point2_trans(1)],[y(i)+point1_trans(2),y(i)+point2_trans(2)],...
        [z(i)+point1_trans(3),z(i)+point2_trans(3)],"LineWidth",3,"Color","r");
    hold on;
    h2 = plot3([x(i)+point3_trans(1),x(i)+point4_trans(1)],[y(i)+point3_trans(2),y(i)+point4_trans(2)],...
        [z(i)+point3_trans(3),z(i)+point4_trans(3)],"LineWidth",3,"Color","b");
    point = scatter3(xd(i),yd(i),zd(i),100,"filled","g");
    set(gca,'ztick',0:20:z(i)+5)
%     pause(0.1)
end

%绘制位置图像
figure(2);clf;
subplot(3,1,1)
h1 = plot(tout,xd,"r--","LineWidth",2);hold on;
h2 = plot(tout,x,"b-","LineWidth",2);
legend([h1,h2],["参考位置xd","实际位置x"])
grid on;
subplot(3,1,2)
h3 = plot(tout,yd,"r--","LineWidth",2);hold on;
h4 = plot(tout,y,"b-","LineWidth",2);
legend([h3,h4],["参考位置yd","实际位置y"])
grid on;
subplot(3,1,3)
h5 = plot(tout,zd,"r--","LineWidth",2);hold on;
h6 = plot(tout,z,"b-","LineWidth",2);
legend([h5,h6],["参考位置zd","实际位置z"])
grid on;
%绘制角度图像
figure(3);clf;
subplot(3,1,1)
h7 = plot(tout,phi,"LineWidth",2); hold on;
legend(h7,"phi"),grid on;

subplot(3,1,2)
h8 = plot(tout,psai,"LineWidth",2);
legend(h8,"psai"),grid on;

subplot(3,1,3)
h9 = plot(tout,theta,"LineWidth",2);hold on;
legend(h9,"theta"),grid on;
