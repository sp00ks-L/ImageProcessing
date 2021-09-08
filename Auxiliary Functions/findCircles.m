function centroids = findCircles(img)
    % findCircles: Locates four black circles in image and returns centroids
    
    % Binarise Image + find connected components
    BW = edge(rgb2gray(img), "Canny", [0.01, 0.9]);
    objects = bwconncomp(BW);
    
    % Returns the convex area of every connected component
    CC = regionprops("table", BW, 'ConvexArea');
    minFour = mink(CC.ConvexArea, 4);
    % Bool array to locate the smallest 4 areas
    % In theory the smallest areas should be all the circles
    idx = ismember(CC.ConvexArea, minFour); 
    
    pxlList = objects.PixelIdxList;
    pxlList(~idx) = []; % Deletes all false (0) elements
    
    centroids = zeros(numel(pxlList), 2);
    for i=1:numel(pxlList)
        [r, c] = ind2sub(size(img), pxlList{i});
        centroids(i,:) = mean([c r]);
    end
end

