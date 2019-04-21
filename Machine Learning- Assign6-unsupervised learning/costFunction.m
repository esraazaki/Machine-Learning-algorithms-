function cost = costFunction(X,centroids,idx) 
    m = size(X,1) ; % number of training examples ( 1st dimension of X
    n = size(X,2) ; % number of features(2nd dimension of X)
    cost_vector = zeros (m,1) ; % contains cost for each training example
    for i =1:m % loop over each training example 
        cost_vector(i) = sum(abs(centroids(idx(i,1),:)- X(i,:))) ; % calculate the cost for this example 
    end 
    cost = (1/m) * sum(cost_vector) ; 
end 
