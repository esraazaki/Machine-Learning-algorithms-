function centroids = computeCentroids(X, idx, K)
  [m n] = size(X);
  centroids = zeros(K, n);
  centroid_sum= zeros(1,n); 
  counter = 0 ;
  for i=1:K
   for j =1:m 
       if(idx(j)==i)
           centroid_sum = centroid_sum + X(j,:) ;
           counter = counter +1 ;
       end 
   end 
   centroids(i,:) = (1/counter) * centroid_sum ;
   centroid_sum= zeros(1,n); 
   counter = 0 ;
  end 
end