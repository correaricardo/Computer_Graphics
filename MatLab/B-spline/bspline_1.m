%- Reset all
close all;
clear all;
clc;    

%- Points
p0 = [0; 2];
p1 = [1;-1];
p2 = [3; 0];
p3 = [5;-2];

%--------------------------%
%  Curve of degree 0: p=0  %
%--------------------------%

%- Knot vector.
%- t0 = [0, 2, 3, 4, 6];

%- Basis functions
n00 = 1; %- [0,2]
n10 = 1; %- [2,3]
n20 = 1; %- [3,4]
n30 = 1; %- [4,6]

%- Graph
%- Curve
c = n00*p0 + n10*p1 + n20*p2 + n30*p3;
figure('Name','Curve with p=0','NumberTitle','off');
plot([p0(1),p1(1),p2(1),p3(1)],[p0(2),p1(2),p2(2),p3(2)],'o') 
%- Basis functions
figure('Name','Basis functions with p=0','NumberTitle','off');
plot([0 2], [1 1], 'red',[2 3], [1 1], 'green',[3 4], [1 1], 'blue',[4 6], [1 1], 'yellow')


%--------------------------%
%  Curve of degree 1: p=1  %
%--------------------------%

%- Knot vector.
%- t1 = [0, 0, 2, 3, 5, 5];
t1   = 0:0.001:5;       
t11 = t1(t1(:)>=0 & t1(:)<=2);
t12 = t1(t1(:)>=2 & t1(:)<=3);
t13 = t1(t1(:)>=3 & t1(:)<=5);

%- Basis functions
n01     = (2 - t11)./2; %- [0,2]
n11_1   = (t11 ./ 2);   %- [0,2]
n11_2   = (3 - t12);    %- [2,3]
n21_1   = (t12 - 2);    %- [2,3]
n21_2   = (5 - t13)./2; %- [3,5]
n31     = (t13 - 3)./2; %- [3,5]

figure('Name','Basis functions with p=1','NumberTitle','off');
plot(t11,n01,'red',t11,n11_1,'green',t12,n11_2,'green',t12,n21_1,'black',t13,n21_2,'black',t13,n31,'blue');

%- Curve

c1 = n01.*p0   + n11_1.*p1;
c2 = n11_2.*p1 + n21_1.*p2;
c3 = n21_2.*p2 + n31.*p3;
figure('Name','Curve with p=1','NumberTitle','off');
plot(c1(1,:),c1(2,:),'red',c2(1,:),c2(2,:),'blue',c3(1,:),c3(2,:),'green');
xlabel('x');
ylabel('y');

%--------------------------%
%  Curve of degree 2: p=2  %
%--------------------------%

%- Knot vector.
%- t2 = [0, 0, 0, 3, 4, 4, 4];
t2   = 0:0.001:4;       
t21 = t2(t2(:)>=0 & t2(:)<=3);
t22 = t2(t2(:)>=3 & t2(:)<=4);

%- Basis functions
n02     = ((3-t21).^2)./9;         %- [0,3]

n12_1   = (t21.*(3-t21))./9;       %- [0,3]
n12_2   = ((4-t21).*t21)./12;      %- [0,3]
n12_3   = ((4-t22).^2)./4;         %- [3,4]

n22_1   = (t21.^2)./12;            %- [0,3]
n22_2   = (t22.*(4-t22))./4;       %- [3,4]
n22_3   = (4-t22).*(t22-3);        %- [3,4]

n32     = (t22-3).^2;              %- [3,4]

figure('Name','Basis functions with p=2','NumberTitle','off');
plot(t21,n02,'red',...
     t21,n12_1,'green',t21,n12_2,'green',t22,n12_3,'green',...
     t21,n22_1,'blue',t22,n22_2,'blue',t22,n22_3,'blue',...
     t22,n32,'black');

%- Curve
c4 = n02.*p0 + (n12_1 + n12_2).*p1 + n22_1.*p2;
c5 = n12_3.*p1 + (n22_2 + n22_3).*p2 + n32.*p3;
figure('Name','Curve with p=2','NumberTitle','off');
plot(c4(1,:),c4(2,:),'red',c5(1,:),c5(2,:),'blue');
xlabel('x');
ylabel('y');

%--------------------------%
%  Curve of degree 3: p=3  %
%--------------------------%
%- Knot vector.
%- t2 = [0, 0, 0, 0, 1, 1, 1, 1];
t3   = 0:0.001:1;       

%- Basis functions
n03 = (1-t3).^3;
n13 = 3.*((1-t3).^2).*t3;
n23 = 3.*(1-t3).*(t3.^2);
n33 = t3.^3;

figure('Name','Basis functions with p=3','NumberTitle','off');
plot(t3,n03,'red',t3,n13,'blue',t3,n23,'green',t3,n33,'black');

%-Curve

c6 = n03.*p0 + n13.*p1 + n23.*p2 + n33.*p3;

figure('Name','Curve with p=3','NumberTitle','off');
plot(c6(1,:),c6(2,:),'red');
xlabel('x');
ylabel('y');