%- Reset all
close all;
clear all;
clc;

%- Weights
w = [1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1];

%- Knot vectors
u = 0:0.1:4;
v = 0:0.1:1;

%-----------%
%---ELBOW---%
%-----------%

%-----------------%
%---Outer elbow---%
%-----------------%


%-Beginning
C1_02 = [ -2 ; 0; 1; 1];
C1_12 = [ -2 ; 2; 1; 1];
C1_22 = [ 0 ; 2; 1; 1];
C1_32 = [ 2 ; 2; 1; 1];
C1_42 = [ 2 ; 0; 1; 1];
C1_52 = [ 2 ;-2; 1; 1];
C1_62 = [ 0 ;-2; 1; 1];
C1_72 = [ -2 ;-2; 1; 1];
C1_82 = [ -2 ; 0; 1; 1];
OuterElbowBeginning = [{C1_02}, {C1_12}, {C1_22}, {C1_32}, {C1_42}, {C1_52}, {C1_62}, {C1_72}, {C1_82}];


%-Middle
C2_02 = [  -2 ; 0; -5; 1];
C2_12 = [ -2 ; 2; -5; 1];
C2_22 = [ 0 ; 2; -3; 1];
C2_32 = [ 2 ; 2; -1; 1];
C2_42 = [  2 ; 0; -1; 1];
C2_52 = [  2 ;-2;  -1; 1];
C2_62 = [  0 ; -2;  -3; 1];
C2_72 = [  -2 ; -2;  -5; 1];
C2_82 = [  -2 ; 0; -5; 1];
OuterElbowMiddle= [{C2_02}, {C2_12}, {C2_22}, {C2_32}, {C2_42}, {C2_52}, {C2_62}, {C2_72}, {C2_82}];


%-The End
C3_02 = [ 3 ;  0; -5; 1];
C3_12 = [ 3 ;  2;  -5; 1];
C3_22 = [ 3 ;  2;  -3; 1];
C3_32 = [ 3 ;  2;  -1; 1];
C3_42 = [ 3 ; 0;  -1; 1];
C3_52 = [ 3 ; -2;  -1; 1];
C3_62 = [ 3 ;  -2;  -3; 1];
C3_72 = [ 3 ;  -2;  -5; 1];
C3_82 = [ 3 ;  0 ; -5; 1];

OuterElbowEnd = [{C3_02}, {C3_12}, {C3_22}, {C3_32}, {C3_42}, {C3_52}, {C3_62}, {C3_72}, {C3_82}];

%---------------------%
%-----Inner elbow-----%
%---------------------%

%-Beginning
MC1_02 = [ -1 ; 0; 1; 1];
MC1_12 = [ -1 ; 1; 1; 1];
MC1_22 = [ 0 ; 1; 1; 1];
MC1_32 = [ 1 ; 1; 1; 1];
MC1_42 = [ 1 ; 0; 1; 1];
MC1_52 = [ 1 ;-1; 1; 1];
MC1_62 = [ 0 ;-1; 1; 1];
MC1_72 = [ -1 ;-1; 1; 1];
MC1_82 = [ -1 ; 0; 1; 1];
InnerElbowBeginning = [{MC1_02}, {MC1_12}, {MC1_22}, {MC1_32}, {MC1_42}, {MC1_52}, {MC1_62}, {MC1_72}, {MC1_82}];


%-Middle
MC2_02 = [  -1 ; 0; -4; 1];
MC2_12 = [ -1 ; 1; -5; 1];
MC2_22 = [ 0 ; 1; -3; 1];
MC2_32 = [ 1 ; 1; -2; 1];
MC2_42 = [  1 ; 0; -2; 1];
MC2_52 = [  1 ;-1;  -2; 1];
MC2_62 = [  0 ; -1;  -3; 1];
MC2_72 = [  -1 ; -1;  -4; 1];
MC2_82 = [  -1 ; 0; -4; 1];
InnerElbowMiddle = [{MC2_02}, {MC2_12}, {MC2_22}, {MC2_32}, {MC2_42}, {MC2_52}, {MC2_62}, {MC2_72}, {MC2_82}];

%-The end
MC3_02 = [ 3 ;  0; -4; 1];
MC3_12 = [ 3 ;  1;  -4; 1];
MC3_22 = [ 3 ;  1;  -3; 1];
MC3_32 = [ 3 ;  1;  -2; 1];
MC3_42 = [ 3 ; 0;  -2; 1];
MC3_52 = [ 3 ; -1;  -2; 1];
MC3_62 = [ 3 ;  -1;  -3; 1];
MC3_72 = [ 3 ;  -1;  -4; 1];
MC3_82 = [ 3 ;  0 ; -4; 1];
InnerElbowEnd = [{MC3_02}, {MC3_12}, {MC3_22}, {MC3_32}, {MC3_42}, {MC3_52}, {MC3_62}, {MC3_72}, {MC3_82}];

%-------------------------%
%-------Ring - Above------%
%-------------------------%

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


%------------------------%
%-----Tranformations-----%
%------------------------%

% Translation matrix
MTZ1 = [1,   0,   0,   0;
        0,   1,   0,   0;
        0,   0,   1,   -3;
        0,   0,   0,   1];



% Dilation matrix
MTE1 = [1/2,   0,   0,   0;
        0,   1/2,   0,   0;
        0,   0,     1,   0;
        0,   0,     0,   1];

%-------------------------%
%-------Ring - Below------%
%-------------------------%

% Outer circle
CE1 = [ 3 ;  0; -5; 1];
CE2 = [ 3 ;  2;  -5; 1];
CE3 = [ 3 ;  2;  -3; 1];
CE4 = [ 3 ;  2;  -1; 1];
CE5 = [ 3 ; 0;  -1; 1];
CE6 = [ 3 ; -2;  -1; 1];
CE7 = [ 3 ;  -2;  -3; 1];
CE8 = [ 3 ;  -2;  -5; 1];
CE9 = [ 3 ;  0 ; -5; 1];
CE = [{CE1}, {CE2}, {CE3}, {CE4}, {CE5}, {CE6}, {CE7}, {CE8}, {CE9}];

% Inner circle
CI1 = [ 3 ;  0; -4; 1];
CI2 = [ 3 ;  1;  -4; 1];
CI3 = [ 3 ;  1;  -3; 1];
CI4 = [ 3 ;  1;  -2; 1];
CI5 = [ 3 ; 0;  -2; 1];
CI6 = [ 3 ; -1;  -2; 1];
CI7 = [ 3 ;  -1;  -3; 1];
CI8 = [ 3 ;  -1;  -4; 1];
CI9 = [ 3 ;  0 ; -4; 1];
CI = [{CI1}, {CI2}, {CI3}, {CI4}, {CI5}, {CI6}, {CI7}, {CI8}, {CI9}];


%----------------%
%------Main------%
%----------------%


%-Set surfaces
%Outer elbow
[SurfaceOuterElbow] = calculateCuadraticSurface(OuterElbowBeginning, OuterElbowMiddle, OuterElbowEnd, w, u, v);
[C1, C2, C3] = toGraph(SurfaceOuterElbow, u, v);
%Inner elbow
[SurfaceInnerElbow] = calculateCuadraticSurface(InnerElbowBeginning, InnerElbowMiddle, InnerElbowEnd, w, u, v);
[MC1, MC2, MC3] = toGraph(SurfaceInnerElbow, u, v);
%Ring - Above
[SurfaceRing] = calculateLinearSurface(OuterPoints, InnerPoints, w, u, v);
[P1, P2, P3] = toGraph(SurfaceRing, u, v);
%Cylinder
[SurfaceCylinder] = calculateLinearSurface(PointsA, PointsB, w, u, v);
[P4, P5, P6] = toGraph(SurfaceCylinder, u, v);
%Ring - Middle
SurfaceT = MTZ1*SurfaceRing;
[PT1, PT2, PT3] = toGraph(SurfaceT, u, v);
%Mini Cylinder
SurfaceE = MTE1*SurfaceCylinder;
[PT4, PT5, PT6] = toGraph(SurfaceE, u, v);
%Ring - Below
[SurfaceCaraAbajo] = calculateLinearSurface(CE, CI, w, u, v);
[CD1, CD2, CD3] = toGraph(SurfaceCaraAbajo, u, v);

%Graph
figure('Name','Elbow + Cylinder','NumberTitle','off');hold on
surf(C1,C2,C3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(MC1,MC2,MC3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(CD1,CD2,CD3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(P1, P2, P3, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(P4, P5, P6, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(PT1, PT2, PT3, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(PT4, PT5, PT6, 'FaceColor','interp','FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
xlabel('x')
ylabel('y')
zlabel('z') 