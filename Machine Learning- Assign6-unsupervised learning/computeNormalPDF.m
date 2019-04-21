function [ NormalPDF ] = computeNormalPDF(X_new, Mean, Std_dev )
% X= 1x n
n = size(X_new,2) ; % number of features 
NormalPDF = 1 ; 
for i=1:n 
    exp_part = exp(-1*(X_new(1,i)-Mean(1,i))^2/(2*Std_dev(1,i)^2)) ;
    NormalPDF= NormalPDF* (((1/(sqrt(2*pi)*Std_dev(1,i)))*exp_part)) ;
end

