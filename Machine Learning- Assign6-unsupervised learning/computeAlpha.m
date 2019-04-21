function alpha = computeAlpha(S, K)

eigen_values= diag(S) ; 
K_eigen_values_sum = 0; 

for i=1:K 
    K_eigen_values_sum = K_eigen_values_sum+ eigen_values(i,1) ;
end 
alpha = 1- ((K_eigen_values_sum)/sum(eigen_values));

end 