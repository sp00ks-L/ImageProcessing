function [inputImage, outputImage] = processImage(path, sigmoid)
    % processImage: Returns smoothed image located at path 
    originalImage = imread(path);
    % Applies gaussian smoothing. High sigmoid = High smoothing
    inputImage = imgaussfilt(originalImage, sigmoid); 
    outputImage = rgb2lab(inputImage);
end

