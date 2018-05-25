%- Reset all
close all;
clear all;
clc;

%- Parameter
t = -1.00:0.01:5.00;

%- Points
p0 = [0;0];
p1 = [1;0];
p2 = [2;1];

%- Funciones base
L01 = (t.*(t-5))/6;
L11 = ((t+1).*(t-5))/-5; 
L21 = (t.*(t+1))/30;

L02 = ((t-4).*(t-5))/30;
L12 = ((t+1).*(t-5))/-5;
L22 = ((t-4).*(t+1))/6;

%- Curves;
c1 = L01.*p0 + L11.*p1 + L21.*p2;
c2 = L02.*p0 + L12.*p1 + L22.*p2;

%- Plot curves
figure('Name','Lagrange interpolation','NumberTitle','off');
plot(c1(1,:),c1(2,:),'red',c2(1,:),c2(2,:),'blue');
xlabel('x')
ylabel('y')

