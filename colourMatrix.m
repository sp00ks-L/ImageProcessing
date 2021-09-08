function result = colourMatrix(targetImage)
    % colourMatrix: Returns a string array of colour classifications
    % PARAMS: targetImage:  path to image on disk
    % RETURNS: string array

    % Import image: sigmoid = level of smoothing
    sigmoid = 2;
    [rgbImg, labImg] = processImage(targetImage, sigmoid);
    
    % Plotting the original image for comparison
    figure;
    subplot(1, 2, 1)
    imshow(rgbImg)
    title("Original " + " w/ Gaussian Smoothing, sigmoid: " + sigmoid)

    if (isTransformed(rgbImg))  
        [rgbImgCorrected , labImgCorrected] = autoCorrection(rgbImg);
        
        subplot(1, 2, 2)
        imshow(rgbImgCorrected)
        title("Corrected Image")
        
        result = getColourMatrix(labImgCorrected);
    else
        % No plot here because image is not transformed
        result = getColourMatrix(labImg);
    end
end

