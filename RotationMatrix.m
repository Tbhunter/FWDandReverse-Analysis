function [R] = RotationMatrix(m,th)

%parameters in degrees
theta = th*pi/180;

mx = m(1)/norm(m);
my = m(2)/norm(m);
mz = m(3)/norm(m);

%rotation matrix values
r11 = (mx^2) *(1-cos(theta))  + cos(theta); 
r12 = (mx*my)*(1-cos(theta))  - mz*sin(theta);
r13 = (mx*mz)*(1-cos(theta))  + my*sin(theta);
r21 = (mx*my)*(1-cos(theta))  + mz*sin(theta);
r22 = (my^2) *(1-cos(theta))  + cos(theta); 
r23 = (my*mz)*(1-cos(theta))  - mx*sin(theta);
r31 = (mx*mz)*(1-cos(theta))  - my*sin(theta);
r32 = (my*mz)*(1-cos(theta))  + mx*sin(theta);
r33 = (mz^2) *(1-cos(theta))  + cos(theta);

% rotation transformation matrix
R = [r11 r12 r13 ; r21 r22 r23 ; r31 r32 r33];

end