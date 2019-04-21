function [ reduced_data K_optm reconstructed_data] = ReduceData( X,alpha_boundary)
m = size(X,1) ;
n = size(X,2) ;

x_cov=cov(X) ; % nxn 
[U S V] =  svd(x_cov) ; % U=S=V= nxn (where n = original dimension/ number of features)
% find k where k is the min number of dimensions that can be used 
K_optm = 0 ; 

for k=1:n 
    alpha = computeAlpha(S,k) ; 
    if (alpha < alpha_boundary ) 
        K_optm = k ;
        break ; 
    end 
end 

reduced_data = (U(:,(1:k))' * X')' ; 
reconstructed_data = reduced_data * U(:,(1:k))' ;


end

