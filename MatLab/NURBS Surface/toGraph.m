%%% Function: toGraph
%% ----------------------------
%%   Separates and returns the starting points of the end points.
%%
%%   S: The surface
%%   U: First knot vector array 
%%	 V: Second knot vector array
%%
%%   returns: the points of the surface.
%%%
function [X, Y, Z] = toGraph(S,U,V)
    
k = 1;
i = 1;
k = 1;  
for i = 1:size(U,2)
    for j = 1:size(V,2)
        X(i,j) = S(1,k);
        Y(i,j) = S(2,k);
        Z(i,j) = S(3,k);
        k = k + 1;
    end
end


end