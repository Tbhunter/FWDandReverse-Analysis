function [theta_a,theta_b] = solve_trig(A,B,D)

tolerance = .001;
D_eq = -D/(sqrt(A^2+B^2));
if (NearValue_Function(D_eq,1,tolerance) == 0)

    cosgamma =  A/(sqrt(A^2+B^2));
    singamma =  B/(sqrt(A^2+B^2));
    gamma    =  atan2d(singamma,cosgamma);
    theta_a  =  acosd(D_eq) + gamma;
    theta_b  = -acosd(D_eq) + gamma;
    %disp('1')
else
    
    theta_a  = 0;
    theta_b  = 0;
    %disp('0')
    
end

end 