%- Reset all.
close all;
clear all;
clc;

%- Let's storage the vertices in an array.
[file,path] = uigetfile('*.stl');
if isequal(file,0)
   disp('User selected Cancel');
else
    fid    = fopen(file,'r');
end

scientific = '([-]?(?:[0-9]*[.])?[0-9]+(?:[eE][-+]?[0-9]+))';
regex      = '\s*vertex\s*([-]?(?:[0-9]*[.])?[0-9]+(?:[eE][-+]?[0-9]+)?)\s*([-]?(?:[0-9]*[.])?[0-9]+(?:[eE][-+]?[0-9]+)?)\s*([-]?(?:[0-9]*[.])?[0-9]+(?:[eE][-+]?[0-9]+)?)';
line_ex    = fgetl(fid);
i          = 1;

while ~feof(fid)
    line_ex = fgetl(fid);
    if regexp(line_ex,regex)
        toks = regexp(line_ex, regex, 'tokens');  
        
        %- Points
        
        %- Check for scientific notation
        if(regexp(toks{:}{1},'scientific'))
            p(i,1) = disp(num2str(str2double(toks{:}{1}),'%.0f'));
        else
            p(i,1) = str2double(toks{:}{1});
        end
        
        if(regexp(toks{:}{3},'scientific'))
            p(i,2) = disp(num2str(str2double(toks{:}{3}),'%.0f'));
        else
            p(i,2) = str2double(toks{:}{3});
        end
        
        if(regexp(toks{:}{2},'scientific'))
            p(i,3) = disp(num2str(str2double(toks{:}{2}),'%.0f'));
        else
            p(i,3) = str2double(toks{:}{2});
        end
        
        %- Homogenic coordinates.
        p(i,4) = 1;
        
        %- Simple counter
        i = i + 1;
        
    end
end
fclose(fid);

%- Indices.
k = 1;
for j = 1:(size(p,1)/3)
        t(j,1) = k;
        t(j,2) = k+1;
        t(j,3) = k+2;
        k = k + 3;
end

%- Do it.

graph(t,p,'Normal STL');

%- Morphing box.
%
%
%- Point 5 -> pmin.
%- Point 3 -> pmax.
%
%
%      1________4
%     /|       /|
%   2/_|_____3/ |
%   |  5_____|__8
%   | /      | /
%   |/_______|/
%   6       7
%

pointLabelText = uicontrol('Style','text',...
                            'Position',[0 90 20 20],...
                            'String','d:');
pointEditText = uicontrol('Style', 'edit', 'String', '3',...
                          'Position', [20 90 50 20]'); 

xLabelText = uicontrol('Style','text',...
                       'Position',[0 70 20 20],...
                       'String','x:');
xEditText     = uicontrol('Style', 'edit', 'String', '3',...
                          'Position', [20 70 50 20]');
                      
yLabelText = uicontrol('Style','text',...
                       'Position',[0 50 20 20],...
                       'String','y:');                      
yEditText     = uicontrol('Style', 'edit', 'String', '3',...
                          'Position', [20 50 50 20]'); 

zLabelText = uicontrol('Style','text',...
                       'Position',[0 30 20 20],...
                       'String','z:');                      
zEditText     = uicontrol('Style', 'edit', 'String', '3',...
                          'Position', [20 30 50 20]');         
                      

doItButton    = uicontrol('Style', 'push', 'String', 'Graph',...
                          'Position', [20 10 50 20],...
                          'Callback',...
                          @(btn,event) morphGraph(get(pointEditText, 'String'),...
                                                  p,...
                                                  t,...
                                                  get(xEditText, 'String'),...
                                                  get(yEditText, 'String'),...
                                                  get(zEditText, 'String')));       


%- Graph STL
function graph(a,b,c)

TR = triangulation(a,b(:,[1,2,3]));
figure('Name',c,'NumberTitle','off');
trisurf(TR,'FaceColor',[1 0.6 0],'EdgeColor','none','FaceLighting','gouraud','AmbientStrength', 0.15);

%- Fix the axes scaling, and set a nice view angle
axis tight;
view([50, 135, 100]);
xlim([0 inf]);
ylim([0 inf]);
zlim([0 inf]);
xlabel('x');
ylabel('z');
zlabel('y');

%- Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

end

%- Morping box graph
function morphGraph(b,p,t,x,y,z)

%- Integers
b = str2double(b);
x = str2double(x);
y = str2double(y);
z = str2double(z);


%- Cube limiters
xmax = max(p(:,1));
ymax = max(p(:,3));
zmax = max(p(:,2));
xmin = min(p(:,1));
ymin = min(p(:,3));
zmin = min(p(:,2));
    
    for i = 1:size(p,1)
            
    n1 = ((p(i,1)-xmax)./(xmin-xmax)).*((p(i,3)-ymin)./(ymax-ymin)).*((p(i,2)-zmax)./(zmin-zmax)); 
    n2 = ((p(i,1)-xmin)./(xmax-xmin)).*((p(i,3)-ymin)./(ymax-ymin)).*((p(i,2)-zmax)./(zmin-zmax)); 
    
    n3 = ((p(i,1)-xmax)./(xmin-xmax)).*((p(i,3)-ymin)./(ymax-ymin)).*((p(i,2)-zmin)./(zmax-zmin)); 
    n4 = ((p(i,1)-xmin)./(xmax-xmin)).*((p(i,3)-ymin)./(ymax-ymin)).*((p(i,2)-zmin)./(zmax-zmin)); 

    n5 = ((p(i,1)-xmax)./(xmin-xmax)).*((p(i,3)-ymax)./(ymin-ymax)).*((p(i,2)-zmax)./(zmin-zmax)); 
    n6 = ((p(i,1)-xmin)./(xmax-xmin)).*((p(i,3)-ymax)./(ymin-ymax)).*((p(i,2)-zmax)./(zmin-zmax)); 
    
    n7 = ((p(i,1)-xmax)./(xmin-xmax)).*((p(i,3)-ymax)./(ymin-ymax)).*((p(i,2)-zmin)./(zmax-zmin)); 
    n8 = ((p(i,1)-xmin)./(xmax-xmin)).*((p(i,3)-ymax)./(ymin-ymax)).*((p(i,2)-zmin)./(zmax-zmin)); 
    
    n  = [n1,n2,n3,n4,n5,n6,n7,n8];
        
        displacement = [x,y,z];
        for j = 1:(size(p,2)-1)     
            px(i,j) = p(i,j) + displacement(j).*n(b);
        end
    end
    
    %- Do it.
    graph(t,px,'Morphing box STL');

end