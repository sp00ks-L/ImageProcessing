function label = classifyColour(l, a, b)
    % classifyColour: Accepts mean LAB values, returns char colour labe
    
    if (l > 82)
        if (a < -35)
            label = "G";  % Green
        elseif (b > 35)
            label = "Y";  % Yellow
        else
            label = "W";  % White
        end
    elseif (l < 82) && (b < -15)
        label = "B";  % Blue
    elseif (abs(a) < 3) && (abs(b) < 3)
        label = "W";  % White again
    else
        label = "R";  % Red
    end
end

