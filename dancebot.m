clc;
clear all;

l1 = 5; l2 = 3; range = 3; step = 0.5; xg1 = 8; xg2 = 10; t=4;
while true
    for a = -range:step:range
        %initial body
        body=rectangle('Position',[a-5 8 5 10]);
        head=rectangle('Position',[a-5 20 5 6],'Curvature',[1 1]);
        neck=rectangle('Position',[a-3 18 1 2]); 
        mx1=[0 5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        my1=[0 5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        leg1=plot(mx1,my1);
        mx2=[5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),a];
        my2=[5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),8];
        leg1_2=plot(mx2,my2);
        mx3=[-5 -5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        my3=[0 5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        leg2=plot(mx3,my3);
        mx4=[-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),a-5];
        my4=[5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),8];
        leg2_2=plot(mx4,my4);

        %arms
        mx7=[a a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        my7=[18 18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        arm1=plot(mx7,my7);
        mx8=[a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),0];
        my8=[18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),17];
        mx9=[a-5 a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        my9=[18 18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        arm2_1=plot(mx9,my9);
        mx10=[a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),-5];
        my10=[18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),17];

        %arms rotation
        theta = pi/3;
        R1 = [cos(theta) -sin(theta); -sin(theta) -cos(theta)];
        arm1_2_coords = [mx8; my8];
        arm1_2_coords = R1*(arm1_2_coords - [mx7(2); my7(2)]) + [mx7(2); my7(2)];
        mx8 = arm1_2_coords(1,:);
        my8 = arm1_2_coords(2,:);
        R2 = [-cos(theta) sin(theta); sin(theta) cos(theta)];
        arm2_2_coords = [mx10; my10];
        arm2_2_coords = R2*(arm2_2_coords - [mx9(2); my9(2)]) + [mx9(2); my9(2)];
        mx10 = arm2_2_coords(1,:);
        my10 = arm2_2_coords(2,:);
        
        arm1_2=plot(mx8,my8);
        hold on
        arm2_2=plot(mx10,my10);
        axis([-20 10 -2 35]);
        pause(0.05);
        
        delete(leg1);
        delete(leg1_2);
        delete(leg2);
        delete(leg2_2);
        delete(head);
        delete(body);
        delete(neck);
        delete(arm1);
        delete(arm1_2);
        delete(arm2_1);
        delete(arm2_2);
    end
    xg1=5-xg1;
    xg2=5-xg2;
    range=-range;
    step=-step;
    t=-t;
end