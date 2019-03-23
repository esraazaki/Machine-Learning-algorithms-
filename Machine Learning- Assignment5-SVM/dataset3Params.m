function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 

%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 

%

% prediction_error_vector = zeros(64);
% C_vector = zeros(64) ;
% sigma_vector = zeros(64) ;
index = 0;


% loop over all values of sigma and c and find the error in each case 
for sigma_values = [0.01 0.03 0.1 0.3 1 3 10 30]
    for C_values = [0.01 0.03 0.1 0.3 1 3 10 30]       
        
        % aplly SVM code to the set to find the error 
        model = svmTrain(X, y, C_values, @(x1, x2) gaussianKernel(x1, x2, sigma_values));
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions ~= yval));

        % save all the errors in a avector with the corresponding values of
        % c and sigma 
        
        index = index + 1;
        prediction_error_vector(index) = prediction_error;   
        C_vector(index) = C_values ;
        sigma_vector(index) = sigma_values ;

    end
end

[val,index_of_min]= min(prediction_error_vector) ; % to get the index of minimum error 
C = C_vector(index_of_min); % to get c that corresponds to minimum error 
sigma = sigma_vector(index_of_min);  % to get sigma that corresponds to minimum error 




% =========================================================================

end
