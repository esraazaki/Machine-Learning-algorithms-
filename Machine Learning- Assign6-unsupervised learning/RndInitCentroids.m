function centroids = RndInitCentroids(x,k) 
    m = size(x,1) ; % number of training examples ( 1st dimension of X
    n = size(x,2) ; % number of features(2nd dimension of X)
    centroids = zeros(k,n); 
    % each centroid is considered as if it's a point among the training examples 
    % hence, each centroid should be of dimension as a traning example ( no
    % of features)     
    randidx = randperm(m);
    centroids = x(randidx(1:k), :);
end