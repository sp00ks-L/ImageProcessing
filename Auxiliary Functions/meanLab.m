function [meanL, meanA, meanB] = meanLab(labImg)
    % meanLab: Returns the average LAB values for provided LAB image
    
    % 'all' = computes mean over all elements in channel
    meanL = mean(labImg(:,:,1), 'all');
    meanA = mean(labImg(:,:,2), 'all');
    meanB = mean(labImg(:,:,3), 'all');
end

