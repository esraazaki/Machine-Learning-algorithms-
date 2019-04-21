T = xlsread('E:\GUC Materials\semester 10\machine learning\practical assignments\assignment 6\code_workspace\house_prices_data_training_data.csv');
X= T(:,(4:21)) ;
m = size(X,1) ;
n = size(X,2) ;
[Mean std_dev] = computeMeanDev(X) ; 
X_new = X(200,:) ;  %[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ] ;
normal_PDF = computeNormalPDF (X_new, Mean ,std_dev) ;
disp(normal_PDF) ;
    
