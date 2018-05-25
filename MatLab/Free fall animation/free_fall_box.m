%- Reset all
close all;
clear all;
clc;

%- Timer
t = 0;
r = 1;
y = 1;
e = 0;
vel = 0;
vf  = 50; %- Velocity of the box when it hits the ground
play = 1;
twist = 1;

%- Define points
A = [-1,10,1];
B = [1,10,1];
C = [1,12,1];
D = [-1,12,1];

%- Motion
M = [1, 0,  0;
     0, 1,  0;
     0, 0,  1];

%- Squash and stretch
SQ = [(4/3)^(1/10),  0,              0;
      0,            (3/4)^(1/10),    0;
      0,             0,              1];


%- Animation
graph(A(2),A(1),D(2),B(1));
while play  
    
    %- First moment: A(2)>0
    %- Generate motion
    t = t + 0.0001;
    M(3,2) = vel*t - (4.9*(t^2));
    vel    = vel   - (9.8*t); 
    
    pause(0.0001);
    A = A*M;
    if A(2) < 0
        A(2) = 0;
    end
    B = B*M;
    C = C*M;
    D = D*M;
    
        
    %- Update screen
    graph(A(2),A(1),D(2),B(1));
    
    if abs(vel-vf) < 1.5
        play = 0;
    end
    
    
    if A(2) == 0
        
        %- Fix points
        A = [-1,0,1];
        B = [1,0,1];
        C = [1,2,1];
        D = [-1,2,1];
        
        %- Transformate
        for c = 1:10
            A = A*SQ;
            B = B*SQ;
            C = C*SQ;
            D = D*SQ;
            pause(0.0001);
            graph(A(2),A(1),D(2),B(1));
        end
        SQ(1,1) = (3/4)^(1/10);
        SQ(2,2) = (4/3)^(1/10);
        for v = 1:10
            A = A*SQ;
            B = B*SQ;
            C = C*SQ;
            D = D*SQ;
            pause(0.0001);
            graph(A(2),A(1),D(2),B(1));
        end
        SQ(1,1) = (4/3)^(1/10);
        SQ(2,2) = (3/4)^(1/10);
        
        %- Velocity
        vf  = vel;
        vel = -vel*0.8;
    end

end


%Graph rectangle
%
% c______
% |      |
% |______|
% a,b     d
%
function graph(a,b,c,d)
    clf;
    h = abs(c-a);
    w = abs(d-b);
    rectangle('Position',[b a w h]);
    axis([-5 5 0 10])
end

