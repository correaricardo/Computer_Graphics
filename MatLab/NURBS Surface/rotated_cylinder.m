%- Reset all
close all;
clear all;
clc;

%- Weights
w = [1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1];

%- Knot vectors
u = 0:0.1:4;
v = 0:0.1:1;

%-----------------%
%-------Ring------%
%-----------------%


%- Outer circle
P01 = [ 2 ; 0; 4; 1];
P11 = [ 2 ; 2; 4; 1];
P21 = [ 0 ; 2; 4; 1];
P31 = [-2 ; 2; 4; 1];
P41 = [-2 ; 0; 4; 1];
P51 = [-2 ;-2; 4; 1];
P61 = [ 0 ;-2; 4; 1];
P71 = [ 2 ;-2; 4; 1];
P81 = [ 2 ; 0; 4; 1];
OuterPoints = [{P01}, {P11}, {P21}, {P31}, {P41}, {P51}, {P61}, {P71}, {P81}];

%- Inner circle
P02 = [ 1 ; 0; 4; 1];
P12 = [ 1 ; 1; 4; 1];
P22 = [ 0 ; 1; 4; 1];
P32 = [-1 ; 1; 4; 1];
P42 = [-1 ; 0; 4; 1];
P52 = [-1 ;-1; 4; 1];
P62 = [ 0 ;-1; 4; 1];
P72 = [ 1 ;-1; 4; 1];
P82 = [ 1 ; 0; 4; 1];
InnerPoints = [{P02}, {P12}, {P22}, {P32}, {P42}, {P52}, {P62}, {P72}, {P82}];

[SurfaceRing] = calculateLinearSurface(OuterPoints, InnerPoints, w, u, v);
[P1, P2, P3] = toGraph(SurfaceRing, u, v);

%---------------------%
%-------Cylinder------%
%---------------------%


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

[SurfaceCylinder] = calculateLinearSurface(PointsA, PointsB, w, u, v);
[P4, P5, P6] = toGraph(SurfaceCylinder, u, v);

%--------------%
%-----Main-----%
%--------------%
	
% Translation matrix
MTZ1 = [1,   0,   0,   0;
        0,   1,   0,   0;
        0,   0,   1,   -3;
        0,   0,   0,   1];
SurfaceT = MTZ1*SurfaceRing;
[PT1, PT2, PT3] = toGraph(SurfaceT, u, v);

% Dilation matrix
MTE1 = [1/2,   0,   0,   0;
        0,   1/2,   0,   0;
        0,   0,     1,   0;
        0,   0,     0,   1];
SurfaceE = MTE1*SurfaceCylinder;
[PT4, PT5, PT6] = toGraph(SurfaceE, u, v);

% Rotation matrix
MRX = [1    0           0            0;
       0    cosd(45)    -sind(45)    0;
       0    sind(45)    cosd(45)     0;
       0    0           0            1];


%----------------------------%
%------Rotated cylinder------%
%----------------------------%
   
   
SurfaceR1 = MRX*SurfaceRing;
[R1, R2, R3] = toGraph(SurfaceR1, u, v);
SurfaceR2 = MRX*SurfaceCylinder;
[R4, R5, R6] = toGraph(SurfaceR2, u, v);
SurfaceR3 = MRX*SurfaceT;
[R7, R8, R9] = toGraph(SurfaceR3, u, v);
SurfaceR4 = MRX*SurfaceE;
[R10, R11, R12] = toGraph(SurfaceR4, u, v);

%Graficar
figure('Name','Rotated cylinder','NumberTitle','off');hold on
surf(R1, R2, R3, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(R4, R5, R6, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(R7, R8, R9, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(R10, R11, R12, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
xlabel('x')
ylabel('y')
zlabel('z')

