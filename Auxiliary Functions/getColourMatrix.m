function results = getColourMatrix(img)
    % getColourMatrix Returns string array of classified colours
    
    % Crop centre colour matrix
    coloursCropped = img(75:405, 75:405, :);
    % Works with a char array. Difference is in output
    % "BWYR" rather than "B" "W" "Y" "R"
    results = string(zeros(4, 4));
    % Fixed coordinates to iterate through colour matrix
    coords = [10, 100, 200, 260];
    
    for i = 1:length(coords)
    deltaY = coords(i);
        for j = 1:length(coords)
            deltaX = coords(j);
            squareSlice = coloursCropped(20+deltaY:25+deltaY, 20+deltaX:25+deltaX, :);
            [l, a, b] = meanLab(squareSlice);
            myLabel = classifyColour(l, a, b);
            results(i, j) = myLabel;
        end
    end
end

