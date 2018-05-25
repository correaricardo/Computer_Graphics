%- Reset all
close all;
clear all;
clc;

%- Weights
w = [1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1];

%- Knot vectors
u = 0:0.1:4;
v = 0:0.1:1;

%--------------%
%---Cylinder---%
%--------------%

%- Above
P01 = [ 2 ; 0; 4; 1];
P11 = [ 2 ; 2; 4; 1];
P21 = [ 0 ; 2; 4; 1];
P31 = [-2 ; 2; 4; 1];
P41 = [-2 ; 0; 4; 1];
P51 = [-2 ;-2; 4; 1];
P61 = [ 0 ;-2; 4; 1];
P71 = [ 2 ;-2; 4; 1];
P81 = [ 2 ; 0; 4; 1];
PointsA = [{P01}, {P11}, {P21}, {P31}, {P41}, {P51}, {P61}, {P71}, {P81}];

%- Below
P02 = [ 2 ; 0; 1; 1];
P12 = [ 2 ; 2; 1; 1];
P22 = [ 0 ; 2; 1; 1];
P32 = [-2 ; 2; 1; 1];
P42 = [-2 ; 0; 1; 1];
P52 = [-2 ;-2; 1; 1];
P62 = [ 0 ;-2; 1; 1];
P72 = [ 2 ;-2; 1; 1];
P82 = [ 2 ; 0; 1; 1];
PointsB = [{P02}, {P12}, {P22}, {P32}, {P42}, {P52}, {P62}, {P72}, {P82}];

%--------------%
%-----Main-----%
%--------------%

%-Surface
%- Plot 3d
[Surface] = calculateLinearSurface(PointsA, PointsB, w, u, v);
[P1, P2, P3] = toGraph(Surface, u, v);
figure('Name','Cylinder','NumberTitle','off');
surf(P1, P2, P3, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
xlabel('x')
ylabel('y')
zlabel('z')