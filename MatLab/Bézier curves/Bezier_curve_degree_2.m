%- Reset all
close all;
clear all;
clc;    

%- Parameter
t = 0:0.0001:1;

%- Points
p0 = [1; 1; 1];
p1 = [1; 0; 0];
p2 = [2; 1; 3];

%- Basis functions
b02 = (1-t).^2;
b12 = 2.*(1-t).*t;
b22 = t.^2;

%- Plot
figure('Name','Basis functions','NumberTitle','off');
plot(t,b02,t,b12,t,b22);

%- Curve
c = b02.*p0 + b12.*p1 + b22.*p2;

%- Plot curve
figure('Name','Bezier curve','NumberTitle','off');
plot3(c(1,:),c(2,:),c(3,:));
xlabel('x')
ylabel('y')
zlabel('z')

%- Rotate curve

%- Rotation matrix
R = [  (2+sqrt(3))/4 ,  -(1/(2*sqrt(2))) ,  (2-sqrt(3))/4    ;
       1/(2*sqrt(2)) ,  (sqrt(3))/2      ,  -(1/(2*sqrt(2))) ;
       (2-sqrt(3))/4 ,  1/(2*sqrt(2))    ,  (2+sqrt(3))/4    ];
  
%- Do it
cr = R*c;

%- Plot
figure('Name','Bezier curve','NumberTitle','off');
plot3(cr(1,:),cr(2,:),cr(3,:));
xlabel('x')
ylabel('y')
zlabel('z')

