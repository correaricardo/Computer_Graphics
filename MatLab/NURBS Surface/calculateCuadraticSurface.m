%%% Function: calculateCuadraticSurface
%% ----------------------------
%%   Calculate the surface with basis functions of degree 2
%%
%%   A: Initial points          
%%   B: End points
%%   W: Weights
%%   U: First knot vector array
%%   V: Second knot vector array
%%
%%   returns: the Surface
%%%
function [Surface] = calculateCuadraticSurface(A, B, C, W, U, V)
 

k = 1;
for i = 1:size(U,2)

    %- Knot vector
    %- u = [0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4];    
    %- Basis functions

    %[0,1]
    N02     = (1-U(i))^2;
    N12     = 2*U(i)*(1-U(i));
    N22_1   = U(i)^2;

    %[1,2]
    N22_2   = (2-U(i))^2;
    N32     = 2*(U(i)-1)*(2-U(i));
    N42_1   = (U(i)-1)^2;

    %[2,3]
    N42_2   = (3-U(i))^2;
    N52     = 2*(U(i)-2)*(3-U(i));
    N62_1   = (U(i)-2)^2;

    %[3,4]
    N62_2   = (4-U(i))^2;
    N72     = 2*(U(i)-3)*(4-U(i));
    N82     = (U(i)-3)^2;

    for j = 1:size(V,2)

    %- Knot vector
    %- v = [0, 0, 1, 1];    
    
    %- Basis functions
    %[0,1]
    M02 = (1-V(j))^2;
    M12 = 2*(1-V(j))*V(j);
    M22 = (V(j))^2;
    
    %- Rational basis functions

    if (U(i)>=0 && U(i)<=1)

        S1 = N02*M02*W(1) +   N02*M12*W(1) +   N02*M22*W(1) + ...
             N12*M02*W(2) +   N12*M12*W(2) +   N12*M22*W(2) + ...
           N22_1*M02*W(3) + N22_1*M12*W(3) + N22_1*M22*W(3);

        R01 = (N02*M02*W(1)) / S1;
        R02 = (N02*M12*W(1)) / S1;
        R03 = (N02*M22*W(1)) / S1;

        R11 = (N12*M02*W(2)) / S1;
        R12 = (N12*M12*W(2)) / S1;
        R13 = (N12*M22*W(2)) / S1;

        R21_1 = (N22_1*M02*W(3)) / S1;
        R22_1 = (N22_1*M12*W(3)) / S1;
        R23_1 = (N22_1*M22*W(3)) / S1;

        Z1 = R01*cell2mat(A(1)) + ...
             R02*cell2mat(B(1)) + ...
             R03*cell2mat(C(1)) + ...
             R11*cell2mat(A(2)) + ...
             R12*cell2mat(B(2)) + ...
             R13*cell2mat(C(2)) + ...
             R21_1*cell2mat(A(3)) + ...
             R22_1*cell2mat(B(3)) + ...
             R23_1*cell2mat(C(3));
         
        Surface(:,k)= Z1;
        k = k + 1;

    elseif (U(i)>=1 && U(i)<=2)
    
        S2 = N22_2*M02*W(3) + N22_2*M12*W(3) + N22_2*M22*W(3) + ...
             N32*M02*W(4) + N32*M12*W(4) + N32*M22*W(4) + ...
             N42_1*M02*W(5) + N42_1*M12*W(5) + N42_1*M22*W(5);


        R21_2 = (N22_2*M02*W(3)) / S2;
        R22_2 = (N22_2*M12*W(3)) / S2;
        R23_2 = (N22_2*M22*W(3)) / S2;
        
        R31 = (N32*M02*W(4)) / S2;
        R32 = (N32*M12*W(4)) / S2;
        R33 = (N32*M22*W(4)) / S2;

        R41_1 = (N42_1*M02*W(5)) / S2;
        R42_1 = (N42_1*M12*W(5)) / S2;
        R43_1 = (N42_1*M22*W(5)) / S2;

        Z2 = R21_2*cell2mat(A(3)) + ...
            R22_2*cell2mat(B(3)) + ...
            R23_2*cell2mat(C(3)) + ...
            R31*cell2mat(A(4)) + ...
            R32*cell2mat(B(4)) + ...
            R33*cell2mat(C(4)) + ...
            R41_1*cell2mat(A(5)) + ...
            R42_1*cell2mat(B(5)) + ...
            R43_1*cell2mat(C(5));
        
        Surface(:,k) = Z2;
        k = k + 1;

    elseif (U(i)>=2 && U(i)<=3)
    
        S3 = N42_2*M02*W(5) + N42_2*M12*W(5) + N42_2*M22*W(5) + ...
             N52*M02*W(6) + N52*M12*W(6) + N52*M22*W(6) + ...
             N62_1*M02*W(7) + N62_1*M12*W(7) + N62_1*M22*W(7);

        R41_2 = (N42_2*M02*W(5)) / S3;
        R42_2 = (N42_2*M12*W(5)) / S3;
        R43_2 = (N42_2*M22*W(5)) / S3;

        R51 = (N52*M02*W(6)) / S3;
        R52 = (N52*M12*W(6)) / S3;
        R53 = (N52*M22*W(6)) / S3;


        R61_1 = (N62_1*M02*W(7)) / S3;
        R62_1 = (N62_1*M12*W(7)) / S3;
        R63_1 = (N62_1*M22*W(7)) / S3;

        Z3 = R41_2*cell2mat(A(5)) + ...
            R42_2*cell2mat(B(5)) + ...
            R43_2*cell2mat(C(5)) + ...
            R51*cell2mat(A(6)) + ...
            R52*cell2mat(B(6)) + ...
            R53*cell2mat(C(6)) + ...
            R61_1*cell2mat(A(7)) + ...
            R62_1*cell2mat(B(7)) + ...
            R63_1*cell2mat(C(7));
        
        Surface(:,k)= Z3;
        k = k + 1;
   
    else
        
        S4 = N62_2*M02*W(7) + N62_2*M12*W(7) + N62_2*M22*W(7) + ...
        N72*M02*W(8) + N72*M12*W(8) + N72*M22*W(8) + ...
        N82*M02*W(9) + N82*M12*W(9) + N82*M22*W(9);

        R61_2 = (N62_2*M02*W(7)) / S4;
        R62_2 = (N62_2*M12*W(7)) / S4;
        R63_2 = (N62_2*M22*W(7)) / S4;

        R71 = (N72*M02*W(8)) / S4;
        R72 = (N72*M12*W(8)) / S4;
        R73 = (N72*M22*W(8)) / S4;
        
        
        R81 = (N82*M02*W(9)) / S4;
        R82 = (N82*M12*W(9)) / S4;
        R83 = (N82*M22*W(9)) / S4;


        Z4= R61_2*cell2mat(A(7)) + ...
            R62_2*cell2mat(B(7)) + ...
            R63_2*cell2mat(C(7)) + ...
            R71*cell2mat(A(8)) + ...
            R72*cell2mat(B(8)) + ...
            R73*cell2mat(C(8)) + ...
            R81*cell2mat(A(9)) + ...
            R82*cell2mat(B(9)) + ...
            R83*cell2mat(C(9)); 
        Surface(:,k) = Z4;
        k = k + 1;
    end

    end
end