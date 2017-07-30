function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

g = zeros(size(z));

if size(z) < 2,
g = 1/(1+e^(-1*z));
else,
g = zeros(rows(z),columns(z));
for j = 1:rows(z),
for k = 1:columns(z),
g(j,k) =1/(1+e^(-1*z(j,k)));
end;
end;
end;
