function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

for i = 1:m
  J = J + ( sum( theta' * X'(:,i) ) - y(i) ) ^ 2;
  
end

grad = X' * ( ( X * theta ) - y);
grad(2:end) = grad(2:end) + lambda * theta(2:end);
grad = grad / m;


J = J + lambda * sum(theta(2:end) .^ 2);

J = J / (2 * m);


% =============================================================

grad = grad(:);









% =========================================================================

grad = grad(:);

end
