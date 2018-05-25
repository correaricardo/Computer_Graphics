%- Reset all
close all;
clear all;
clc;

%- Weights
w = [1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1, 1/sqrt(2), 1];

%- Knot vectors
u = 0:0.1:4;
v = 0:0.1:1;

%-------------------------%
%-----Transformations-----%
%-------------------------%

Rotate90Y = [ cosd(90)    0     sind(90)     0;
              0           1     0            0;
              -sind(90)   0     cosd(90)     0;
              0           0     0            1;]; 
    
        
Rotate180Y = [ cosd(180)   0     sind(180)     0;
              0            1     0             0;
              -sind(180)   0     cosd(180)     0;
              0            0     0             1;]; 
        
TranslateZX_1 = [1  0  0  6;
                 0  1  0  0;
                 0  0  1 -6;
                 0  0  0  1];
             
TranslateZX_2 = [1  0  0  9;
                 0  1  0  0;
                 0  0  1 -4;
                 0  0  0  1];      
    
TranslateZX_3 = [1  0  0 -1;
                 0  1  0  0;
                 0  0  1 -7;
                 0  0  0  1];            
             

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


% Outer circle - Below
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

% Inner circle - Below
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

%- Outer circle - Above
P01 = [ 2 ; 0; 1; 1];
P11 = [ 2 ; 2; 1; 1];
P21 = [ 0 ; 2; 1; 1];
P31 = [-2 ; 2; 1; 1];
P41 = [-2 ; 0; 1; 1];
P51 = [-2 ;-2; 1; 1];
P61 = [ 0 ;-2; 1; 1];
P71 = [ 2 ;-2; 1; 1];
P81 = [ 2 ; 0; 1; 1];
PE = [{P01}, {P11}, {P21}, {P31}, {P41}, {P51}, {P61}, {P71}, {P81}];

%- Inner circle - Above
P02 = [ 1 ; 0; 1; 1];
P12 = [ 1 ; 1; 1; 1];
P22 = [ 0 ; 1; 1; 1];
P32 = [-1 ; 1; 1; 1];
P42 = [-1 ; 0; 1; 1];
P52 = [-1 ;-1; 1; 1];
P62 = [ 0 ;-1; 1; 1];
P72 = [ 1 ;-1; 1; 1];
P82 = [ 1 ; 0; 1; 1];
PI = [{P02}, {P12}, {P22}, {P32}, {P42}, {P52}, {P62}, {P72}, {P82}];

% %-------------------%
% %-------Main--------%
% %-------------------%


%-Set surfaces

% %--------------------%
% %-----First elbow----%
% %--------------------%
%-Outter Elbow
[SurfaceOuterElbow_1] = calculateCuadraticSurface(OuterElbowBeginning, OuterElbowMiddle, OuterElbowEnd, w, u, v);
[C1_1, C2_1, C3_1] = toGraph(SurfaceOuterElbow_1, u, v);
%-Inner Elbow
[SurfaceInnerElbow_1] = calculateCuadraticSurface(InnerElbowBeginning, InnerElbowMiddle, InnerElbowEnd, w, u, v);
[MC1_1, MC2_1, MC3_1] = toGraph(SurfaceInnerElbow_1, u, v);
%- Ring above
[SurfaceRingAbove] = calculateLinearSurface(PE, PI, w, u, v);
[CU1, CU2, CU3] = toGraph(SurfaceRingAbove, u, v);

% %---------------------%
% %-----Second elbow----%
% %---------------------%
%-Codo grande
%-Transformate
SurfaceOuterElbow_2 = TranslateZX_1*Rotate180Y*SurfaceOuterElbow_1;
[C1_2, C2_2, C3_2] = toGraph(SurfaceOuterElbow_2, u, v);
%-Mini codo
SurfaceInnerElbow_2 = TranslateZX_1*Rotate180Y*SurfaceInnerElbow_1;
[MC1_2, MC2_2, MC3_2] = toGraph(SurfaceInnerElbow_2, u, v);

% %--------------------%
% %-----Third elbow----%
% %--------------------%
%-Codo grande
%-Transformate
SurfaceOuterElbow_3 = TranslateZX_2*Rotate90Y*SurfaceOuterElbow_2;
[C1_3, C2_3, C3_3] = toGraph(SurfaceOuterElbow_3, u, v);
%-Mini codo
SurfaceInnerElbow_3 = TranslateZX_2*Rotate90Y*SurfaceInnerElbow_2;
[MC1_3, MC2_3, MC3_3] = toGraph(SurfaceInnerElbow_3, u, v);


% %--------------------%
% %-----Four elbow----%
% %--------------------%
%-Codo grande
%-Transformate
SurfaceOuterElbow_4 = TranslateZX_2*Rotate90Y*SurfaceOuterElbow_3;
[C1_4, C2_4, C3_4] = toGraph(SurfaceOuterElbow_4, u, v);
%-Mini codo
SurfaceInnerElbow_4 = TranslateZX_2*Rotate90Y*SurfaceInnerElbow_3;
[MC1_4, MC2_4, MC3_4] = toGraph(SurfaceInnerElbow_3, u, v);
%-Cara de abajo
SurfaceRingBelow = TranslateZX_3*SurfaceRingAbove;
[CD1, CD2, CD3] = toGraph(SurfaceRingBelow, u, v);


%Graph
figure('Name','Hook','NumberTitle','off');hold on
surf(CU1,CU2,CU3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(C1_1,C2_1,C3_1,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(MC1_1,MC2_1,MC3_1,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(C1_2,C2_2,C3_2,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(MC1_2,MC2_2,MC3_2,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(C1_3,C2_3,C3_3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(MC1_3,MC2_3,MC3_3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(C1_4,C2_4,C3_4,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(MC1_4,MC2_4,MC3_4,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
surf(CD1,CD2,CD3,'FaceColor','interp', 'FaceColor',[0 1 0], 'FaceAlpha',0.7, 'EdgeAlpha', 0.5);
xlabel('x')
ylabel('y')
zlabel('z') 