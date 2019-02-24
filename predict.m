function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);  % number of given inputs 
num_labels = size(Theta2, 1); % number of output classes which 10 in our case 

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1); % output vector of size as the number of the given inputs 

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Add ones to the X data matrix
X = [ones(m, 1) X];    %vector of size ( m x 401 )


for i = 1:m  % loop over all the inputs , each loop to predictthe corresponding output for the given input 
    ith_input = X(i,:) ;  % vector of one row and 401 col (1 X401 )   
    Z_2 = Theta1 * (ith_input)' ; % 25x401   *  401x1 =  25x1 
    a_2 = sigmoid(Z_2) ;  %25x1 
    a_2_m = [1 (a_2)'];  % add the bias ,, now it's 1x26
    Z_3 = Theta2 * (a_2_m)' ;  % 10x26  * 26x1 = 10x1 
    a_3 =sigmoid(Z_3) ; %10x1 which is vector of 10 values each one indiacting the probability of each class 
    [val, index] = max(a_3); % search for the highest probabilty and capture the index 
    p(i) = index;
end




% =========================================================================


end
