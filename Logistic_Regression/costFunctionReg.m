function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

thetaT = theta';
%COST COMPUTED!!
cost = 0;

for i = 1:m,
XCol = X(i,:)';
cost += (1/m)*[-y(i,1)*log(sigmoid(thetaT * XCol)) - (1 - y(i,1)) * log(1 - sigmoid(thetaT* XCol))];
end;

for j = 2:size(theta),
cost += lambda*(1/m)*(1/2)*(theta(j)).^2;
end;

J = cost;

%gradient

for j = 1:m,
    XCol = X(j,:)';
    grad(1) += (1/m)*(sigmoid(thetaT*XCol) - y(j,1))*XCol(1,1);
end;


for i = 2:size(theta),
    for j = 1:m,
        XCol = X(j,:)';
        grad(i) += (1/m)*(sigmoid(thetaT*XCol) - y(j,1))*XCol(i,1);
    end;
    grad(i) += (lambda/m)*theta(i);
end;

% =============================================================

end
