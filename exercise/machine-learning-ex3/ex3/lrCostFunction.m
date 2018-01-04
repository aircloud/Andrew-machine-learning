function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
% n = size(theta, 1);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

% 
% for i = 1 : m
%   J = J + ( -y(i) * log( sigmoid(theta' * X'(:,i)) ) - ( 1 - y(i)) * log( 1 - sigmoid(theta' * X'(:,i)) ));
%   % grad(i) = 1 / m * sum( ( sigmoid(theta' * X'(:,i)) ) * X'(:, i) );
%   grad = grad + 1 / m * ( sigmoid(theta' * X'(:,i)) - y(i) ) * X'(:,i); 
% end 


J = sum ( -y .* log( sigmoid( X * theta ) ) - ( 1 - y ) .* log( 1 -  sigmoid( X * theta ) ) );
J = J + lambda / 2 * sum( theta(2:end) .^ 2);  % 注意这里是 (2:end) 其实是舍去第一个 不过matlab中第一个的编号是1 而不是0

grad = X' * ( sigmoid( X * theta ) - y);
grad(2:end) = grad(2:end) + lambda * theta(2:end);

J = J / m;
grad = grad / m;


% =============================================================

grad = grad(:);

end
