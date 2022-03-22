function int = NearValue_Function(value,goal,tolerance)
    if(abs((goal-value)) <= tolerance)
        int = 1;
    else
        int = 0;
    end
end 