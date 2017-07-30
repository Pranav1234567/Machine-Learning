function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(m, 1);

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
A1 = zeros(size(Theta1,2),1);
A2 = zeros(size(Theta2,2),1);
Z2 = zeros(size(Theta1,1));
Z3 = zeros(size(Theta2,1),1);

X = [ones(m,1) X];

for i = 1:m,
    Xval = X(i,:)';
    A1 = Xval;
    Z2 = Theta1*A1;
    A2 = [1; sigmoid(Z2)];
    Z3 = Theta2*A2;
    hypT = sigmoid(Z3)';
    [predict_max,index_max] = max(hypT,[],2);
    p(i) = index_max;
end;


% =========================================================================


end
