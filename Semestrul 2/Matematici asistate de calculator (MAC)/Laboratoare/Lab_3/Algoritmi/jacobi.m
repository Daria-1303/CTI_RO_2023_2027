function x = jacobi(A, b, x0, k)

x = x0;
D = diag(diag(A));

L = tril(A) - D;

U = triu(A) - D;

for i = 1 : k
    x = inv(D) * ( b - (L + U) * x);
end

% A = [3 1 -1; 2 4 1; -1 2 5];
% b = [-4; 4; 13];
% x0 = zeros(3,1);
% x = jacobi(A,b,x0,10)