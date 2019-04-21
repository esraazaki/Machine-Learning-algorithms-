function [ centroids indices] = applyKmean(X,K)
centroids = RndInitCentroids(X, K);
counter = 0 ; % for testing purpuse only 
check_if = 0 ; % for testng purpuse only 

while 1 
  indices = getClosestCentroids(X, centroids);
  new_centroids = computeCentroids(X, indices, K);
  counter = counter+1 ;  % for testng purpuse only 
  error= abs(new_centroids-centroids) ;
  disp(error) ; % for testng purpuse only 
  if ( error < 0.1 ) 
      check_if = 1; % for testng purpuse only 
      break;
  else 
     centroids = new_centroids ;
  end 
end


end

