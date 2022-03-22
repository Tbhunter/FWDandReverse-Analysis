function [T6_F] = FWD_Analysis_Function(phi1,th2,th3,th4,th5,th6)

D2R  = pi/180;

aF1 =  0;
a12 =  0;
a23 =  70;
a34 =  90;
a45 =  0;
a56 =  0;

alpha12 = 270  * D2R;
alpha23 = 0    * D2R;
alpha34 = 0    * D2R;
alpha45 = 270  * D2R;
alpha56 = 90   * D2R;

S1 = 0;
S2 = 0;
S3 = 0;
S4 = 9.8;
S5 = 14.5;
S6 = 15.24;

%Tij = [cos(th) -sin(th) 0 a(ij); 
%       sin(th)*cos(alpha) cos(th)*cos(alpha) -sin(alpha) -sin(alpha)*Sj;
%       sin(th)*sin(alpha) cos(th)*sin(alpha)  cos(alpha)  cos(alpha)*Sj;
%       0 0 0 1]
  

T1_F = [cos(phi1) -sin(phi1) 0 aF1; 
        sin(phi1)*cos(0) cos(phi1)*cos(0) -sin(0) -sin(0)*S1;
        sin(phi1)*sin(0) cos(phi1)*sin(0)  cos(0)  cos(0)*S1;
        0 0 0 1];

T2_1 = [cos(th2) -sin(th2) 0 a12; 
        sin(th2)*cos(alpha12) cos(th2)*cos(alpha12) -sin(alpha12) -sin(alpha12)*S2;
        sin(th2)*sin(alpha12) cos(th2)*sin(alpha12)  cos(alpha12)  cos(alpha12)*S2;
        0 0 0 1];
   
T3_2 = [cos(th3) -sin(th3) 0 a23; 
        sin(th3)*cos(alpha23) cos(th3)*cos(alpha23) -sin(alpha23) -sin(alpha23)*S3;
        sin(th3)*sin(alpha23) cos(th3)*sin(alpha23)  cos(alpha23)  cos(alpha23)*S3;
        0 0 0 1];
   
T4_3 = [cos(th4) -sin(th4) 0 a34; 
        sin(th4)*cos(alpha34) cos(th4)*cos(alpha34) -sin(alpha34) -sin(alpha34)*S4;
        sin(th4)*sin(alpha34) cos(th4)*sin(alpha34)  cos(alpha34)  cos(alpha34)*S4;
        0 0 0 1];

T5_4 = [cos(th5) -sin(th5) 0 a45; 
        sin(th5)*cos(alpha45) cos(th5)*cos(alpha45) -sin(alpha45) -sin(alpha45)*S5;
        sin(th5)*sin(alpha45) cos(th5)*sin(alpha45)  cos(alpha45)  cos(alpha45)*S5;
        0 0 0 1];
    
T6_5 = [cos(th6) -sin(th6) 0 a56; 
        sin(th6)*cos(alpha56) cos(th6)*cos(alpha56) -sin(alpha56) -sin(alpha56)*S6;
        sin(th6)*sin(alpha56) cos(th6)*sin(alpha56)  cos(alpha56)  cos(alpha56)*S6;
        0 0 0 1];  

T6_F = T1_F * T2_1 * T3_2 * T4_3 * T5_4 * T6_5;

end