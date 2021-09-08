function answer = isTransformed(img)
    % isTransformed: Returns TRUE if the image requires transformation
    % Accepts an image in the RGB colour space, applies a radon transform
    % and determines whether the image needs correction based on max theta
    gray_img = rgb2gray(img);
    bin_img = edge(gray_img,'canny');
    bin_img = bwmorph(bin_img,'thicken');
    
    theta = -90:89;
    [R,xp] = radon(bin_img,theta);
    [R1,r_max] = max(R);
    
    theta_max = 90;
    while(theta_max > 50 || theta_max < -50)
        % R2: Maximum Radon transform value over all angles.
        [R2,theta_max] = max(R1);                           
        % Remove element 'R2' from vector 'R1', so that other maximum
        % values can be found.
        R1(theta_max) = 0; 
        theta_max = theta_max - 91;
    end
    
    if (theta_max ~= 0) 
        answer = true;
    else
        answer = false;
    end
end

