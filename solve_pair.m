function [int,X] = solve_pair(eq1,eq2)

syms A1 A2 B1 B2 D1 D2 x y
[A,B]= equationsToMatrix([eq1,eq2],[x,y]);
 R = rank(A);
[m,n] = size(A);
if (R == n)
   
    X = linsolve(A,B);
    int = 1;
    disp('1, values found, linearly independent');

else
    
    int = 0;
    disp('0, not linearly independent');
    X=0;
    
end

end 