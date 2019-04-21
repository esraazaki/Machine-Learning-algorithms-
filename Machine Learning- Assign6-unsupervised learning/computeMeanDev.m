function [mean std_dev] = computeMeanDev(X)
%x = m xn 
m = size(X,1) ; % number of training examples ( 1st dimension of X
n = size(X,2) ; % number of features(2nd dimension of X)

features_sum = zeros(1,n) ; 
for i=1:m
   features_sum= features_sum+ X(i,:); 
end

mean = (1/m)* features_sum ;

std_dev_sum = zeros(1,n ); 

for j= 1:m
    std_dev_sum = std_dev_sum +((X(j,:)-mean).^2);
end 
std_dev =  (1/m)* std_dev_sum ;

end 