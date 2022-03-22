function [a71,S7,S1,alpha71,theta7,gamma1] = Reverse_Analysis(P6tool,PFtool,SF6,aF67,SF1)

R2D = 180/pi;
i = [1 0 0]';
j = [0 1 0]';
k = [0 0 1]';
tolerance = .001;

%% calculate values
SF7  = cross(aF67,SF6);
aF71 = cross(SF7,SF1)/norm(cross(SF7,SF1));

% check c71
c71  = dot(SF7,SF1);

% FOR SPECIAL CASES SUCH AS c71 +- 1 ======================================
%==========================================================================
%==========================================================================


if (NearValue_Function(c71,1,tolerance) == 1)
    S7 = 0;
% PF_6origin
    PF_6orig = PFtool - dot(P6tool,i)*aF67 - dot(P6tool,j)*cross(SF6,aF67) - dot(P6tool,k)*SF6;
    S1       = dot(-PF_6orig,SF1);
    a71      = abs(-(PF_6orig + S1*SF1));
      
    % SUPER SPECIAL CASE a71 = 0
    if(a71 == 0)        
        theta7  = 0;
        a67     = a71;
        c_gam   = dot(aF71,i);
        s_gam   = dot(cross(aF71,i),SF1);
        gamma1  = atan2(s_gam,c_gam) * R2D;
        alpha71 = 0;
        
               
     % NORMAL SPECIAL CASE
    else
         m      = -(PF_6orig + S1*SF1)/a71;
        aF71    = m(:,1);
        
        % Theta7;
        c7      = dot(aF67,aF71);
        s7      = dot(cross(aF67,aF71),SF7);
        theta7  = atan2(s7,c7) * R2D;
        
        % gamma1
        c_gam   = dot(aF71,i);
        s_gam   = dot(cross(aF71,i),SF1);
        gamma1  = atan2(s_gam,c_gam) * R2D;
        alpha71 = 0;
    end
    
    
    
% FOR GENERAL CASES========================================================
%==========================================================================
%==========================================================================
else
    
    s71      = dot(cross(SF7,SF1),aF71);
    alpha71  = atan2(s71,c71) * R2D;

% PF_6origin
    PF_6orig = PFtool - dot(P6tool,i)*aF67 - dot(P6tool,j)*cross(SF6,aF67) - dot(P6tool,k)*SF6; 

%Transformation from Fixed to 6
    R6_F     = [aF67 cross(SF6,aF67) SF6];
    T6_F     = [R6_F PF_6orig; 0 0 0 1];

% Theta7
    c7      = dot(aF67,aF71);
    s7      = dot(cross(aF67,aF71),SF7);
    theta7  = atan2(s7,c7) * R2D;

% gamma1
    c_gam   = dot(aF71,i);
    s_gam   = dot(cross(aF71,i),SF1);
    gamma1  = atan2(s_gam,c_gam) * R2D;

%calculate distances
    S7  = dot(cross(SF1,PF_6orig),aF71)/s71;
    a71 = dot(cross(PF_6orig,SF1),SF7)/s71;
    S1  = dot(cross(PF_6orig,SF7),aF71)/s71;

end

end