%- Reset all
close all;
clear all;
clc;    

%- Parameter
t = 0:0.0001:1;

%- Points
p0 = [0; 1];
p1 = [1; -1];
p2 = [2; 1];
p3 = [3; 0];
p4 = [4; -1];

%- Basis functions
b04 = (1-t).^4; 
b14 = 4.*(1-t).^3.*t;
b24 = 6.*(1-t).^2.*t.^2;
b34 = 4.*(1-t).*t.^3;
b44 = t.^4;

%- Plot
figure('Name','Basis functions','NumberTitle','off');
plot(t,b04,t,b14,t,b24,t,b34,t,b44);

%- Curve
c = b04.*p0 + b14.*p1 + b24.*p2 + b34.*p3 + b44.*p4;

%- Plot curve
figure('Name','Bezier curve','NumberTitle','off');
plot(c(1,:),c(2,:));
xlabel('x')
ylabel('y')



