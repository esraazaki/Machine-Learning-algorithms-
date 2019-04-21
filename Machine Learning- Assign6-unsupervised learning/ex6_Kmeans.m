clear all
% to load the data set 
T = xlsread('E:\GUC Materials\semester 10\machine learning\practical assignments\assignment 6\code_workspace\house_prices_data_training_data.csv');
X= T(:,(4:21)) ;
m = size(X,1) ;
n = size(X,2) ;

% for a given k we can aplly k means 
% K =3 ;
% [centroids indices] = applyKmean(X,K) ;
% cost = costFunction (X,centroids,indices) ;

% to find opt k loop over all k values(1:m) and compute the cost and apply
% el bow method 

for k= 1:m 
 [centroids indices] = applyKmean(X,k) ; 
 
  cost(k) = costFunction (X,centroids,indices) ;
end 
plot(k,cost); 
 