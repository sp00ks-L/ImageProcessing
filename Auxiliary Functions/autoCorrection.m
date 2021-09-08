function [cropped,labImg] = autoCorrection(targetImage)
    % autoCorrection: Returns corrected image in LAB colour space: labImg
    %                 Returns cropped RGB image for comparison if required
    
    % Get centroids of 4 circles in each image
    movingPoints = findCircles(targetImage);
    fixedPoints = [27.0282   26.5028; 26.7486  445.7151; 
        445.3812   26.6354; 445.5667  445.7056];
    
    % Re-order coordinates so that the corners in each respective image are
    % matched
    movingPoints = cell2mat(orderPoints(movingPoints, fixedPoints));
    % Transform can be affine or projective
    mytform = fitgeotrans(movingPoints, fixedPoints, 'affine');   
    out = imwarp(targetImage, mytform);
    
    % Resize / crop image and convert to LAB for output
    cropSize = [480 480];
    r = centerCropWindow2d(size(out), cropSize);
    cropped = imcrop(out,r);
    
    labImg = rgb2lab(cropped);
end

