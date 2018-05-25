%- Reset all
close all;
clear all;
clc;    

%- Parameter
t = 0:0.0001:1;

%- Points
p0 = [1; 1];
p1 = [1; 0];
p2 = [2; 1];

%- Basis functions
b02 = (1-t).^2; 
b12 = 2.*(1-t).*t;
b22 = t.^2;

%- Create curve
c = b02.*p0 + b12.*p1 + b22.*p2;


%- Normal vector
n = [
        (4.*t - 2) ./ ( ( 20.*t.^2) - 16.*t + 4  ).^0.5;
        
        -(2.*t)   ./   ( ( 20.*t.^2) - 16.*t + 4  ).^0.5 
    ];
%- Create offset
o = c + 0.2*n;

%- Plot curve
figure('Name','Offset','NumberTitle','off');
plot(c(1,:),c(2,:),'red',o(1,:),o(2,:),'blue');
xlabel('x')
ylabel('y')



