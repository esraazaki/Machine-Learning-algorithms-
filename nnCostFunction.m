function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%part 1
% Add ones to the X data matrix
X = [ones(m, 1) X];

% Convert y from (1-10)to num_labels vector
yd = eye(num_labels); % eye returns an n-by-n identity matrix with ones on the main diagonal and zeros elsewhere.
y = yd(y,:);

%forward prop
a1=X;
z2=X*Theta1';
a2=sigmoid(z2);

% Add ones to the h1 data matrix
a2=[ones(m, 1) a2];
z3=a2*Theta2';
a3=sigmoid(z3);

%cost
cost=(-y).*log(a3)-(1-y).*log(1-a3); 

%regularised cost
Theta1_R =Theta1(:,2:end);  
Theta2_R=Theta2(:,2:end);
J_R = (lambda/(2*m)).*(sum(sum(Theta1_R.^2))+sum(sum(Theta2_R.^2))) ;

% total cost 
J=((1/m).*sum(sum(cost)))+ J_R ;


%part 2
del_1=0;
del_2=0;
delta_3=a3-y;
z2=[ones(m,1) z2];
delta_2=delta_3*Theta2.*sigmoidGradient(z2);
delta_2=delta_2(:,2:end);
del_1=del_1+delta_2'*a1; % Same size as Theta1_grad (25x401)
del_2=del_2+delta_3'*a2; % Same size as Theta2_grad (10x26)

%Theta1_grad=(1/m).*del_1;
%Theta2_grad=(1/m).*del_2;

%part 3 

Theta1_grad = del_1/m + (lambda/m)*[zeros(hidden_layer_size,1) Theta1(:,2:end)];
Theta2_grad = del_2/m + (lambda/m)*[zeros(num_labels,1) Theta2(:,2:end)];
% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end