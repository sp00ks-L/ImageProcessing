function outputPoints = orderPoints(movingPoints, fixedPoints)
    % orderPoints: Matches pairs of points based on their euclidean proximity
    % This means top-left with top-left, bottom-right with bottom-right etc.
    
    outputPoints = {[4, 2]};
    % Create a copy of movingPoints. We can then retrieve the desired
    % original values from this copy even when I maximise points to
    % [Inf -Inf]
    valueArray = movingPoints;
    
    for i = 1:length(movingPoints)
        minDistance = Inf;
        minDistanceIndex = 0;
        % Select entire row at index i
        p1 = fixedPoints(i, :);
        for j = 1:length(fixedPoints)
            p2 = fixedPoints(j, :);
            X = [p1;p2];
            currentDistance = pdist(X, 'euclidean');
            if currentDistance < minDistance
                minDistance = currentDistance;
                minDistanceIndex = j;
            end        
        end
        % Maximise point that has been selected
        % This prevents re-selection
        fixedPoints(minDistanceIndex, :) = [Inf -Inf];
        outputPoints{i, 1} = valueArray(minDistanceIndex, 1);
        outputPoints{i, 2} = valueArray(minDistanceIndex, 2);
    end    
end

