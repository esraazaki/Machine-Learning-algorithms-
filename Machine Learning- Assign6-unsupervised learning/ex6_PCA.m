clear all
% to load the data set 
T = xlsread('E:\GUC Materials\semester 10\machine learning\practical assignments\assignment 6\code_workspace\house_prices_data_training_data.csv');
X= T(:,(4:21)) ;
m = size(X,1) ;
n = size(X,2) ;
alpha_boundary = 0.001 ;

while 1 
    
[Reduced_data k Reconstructed_data] = ReduceData(X,alpha_boundary) ;
error = zeros(m,1) ;

for i =1:m 
    
error(i,1) = (1/n)* sum(abs(Reconstructed_data(i,:)-X(i,:))) ;
end 
DR_error = (1/m) * sum(error) ; 

if (DR_error<2) 
    break; 
else 
 alpha_boundary=alpha_boundary/10 ;  
end 

end 
        