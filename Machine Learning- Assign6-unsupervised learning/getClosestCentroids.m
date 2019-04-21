function indices = getClosestCentroids(X, centroids)
  K = size(centroids, 1);
  m = size(X,1);
  indices = zeros(m, 1); % vector that holds cluster index for each training example 
  % hence it should be of dimension mx1 
 
  for i=1:m  % loop over all the training examples 
    k = 1;
    min_dist = sum((X(i,:) - centroids(1,:)) .^ 2);
    for j=2:K
        dist = sum((X(i,:) - centroids(j,:)) .^ 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    indices(i) = k;
  end
end