%- Reset all
close all;
clear all;
clc;    

%- Points
p0 = [0;0]; 
p1 = [1;1];
p2 = [2;0];

%- Weights
w = [2,1,0.5,0,-0.5];

%- Parameters
t = 0:0.0001:1;

%- Generate Bernstein polynomials
b02 = (1-t).^2;
b12 = 2.*t.*(1-t);
b22 = t.^2;

%-------------------%
%  Test with W = 2  %
%-------------------%

%- Generate basis functions
W1 = b02.*1 + b12.*w(1) + b22.*1;
r02 = (1.*b02)    ./ W1;
r12 = (w(1).*b12) ./ W1;
r22 = (1.*b22)    ./ W1;

%- Plot
figure('Name','Basis functions with w = 2','NumberTitle','off');
plot(t,r02,t,r12,t,r22);

%- Curve
c = r02.*p0 + r12.*p1 + r22.*p2;
%- Plot curve
figure('Name','Rational bezier curve with w = 2','NumberTitle','off');
plot(c(1,:),c(2,:),'red');
xlabel('x')
ylabel('y')

%- Plot 3d
figure('Name','Projection of a rational bezier curve w = 2','NumberTitle','off');
plot3(c(1,:),c(2,:),W1);
xlabel('x')
ylabel('y')
zlabel('w')

