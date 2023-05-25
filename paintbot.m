% xA = 60; yA = 60; zA = 60;
% xB = 80; yB = 80; zB = 60;
% l1 = 20; l2 = 50; l3 = 40;
R = 100; b = 10; p = 5;

for t=0:pi/100:20*pi
    x = (R - p) * cos(t);
    y = (R - p) * sin(t);
    z = p*(t/(2*pi));
    th1 = atan2(-x,y);
    l1 = z;
    l2 = sqrt(x^2 + y^2);
    Px = -l2 * sin(th1);
    Py = l2 * cos(th1);
    Pz = l1;
    subplot(2,1,1);
    th1 = th1 * 180/pi;
    plot(t,th1,'.',Color='red');
    hold on;
    subplot(2,1,2)
    plot3(Px,Py,Pz,'.', Color='blue');
    hold on;
    grid on;
end