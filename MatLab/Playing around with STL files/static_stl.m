%- Reset all.
close all;
clear all;
clc;

%- Let's storage the vertices in an array.
[file,path] = uigetfile('STL Files\*.stl');
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
graph(t,p);

%- Rotate 90 degrees around the z axis.
R = [
     cosd(90)  0     -sind(90)    0;
     0        1     0           0;
     sind(90)  0     cosd(90)     0;
     0        0     0           1     
    ];
 
p = p*R;
pause(5)
graph(t,p);

%- Reflection matrix (x axis)
R = [ -1    0   0   1;
      0    1   0   0;
      0    0   1   0;
      0    0   0   1]; 
p = p*R;
pause(5)
graph(t,p);


%- Graph STL
function graph(a,b)

TR = triangulation(a,b(:,[1,2,3]));
trisurf(TR,'FaceColor',[1 0.6 0],'EdgeColor','none','FaceLighting','gouraud','AmbientStrength', 0.15);

%- Fix the axes scaling, and set a nice view angle
axis tight;
view([50, 135, 100]);
xlabel('x');
ylabel('z')
zlabel('y')

%- Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

end