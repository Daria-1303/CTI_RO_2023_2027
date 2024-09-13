function x = gauss_seidel(A, b, x0, k)

x = x0;

D = diag(diag(A));

L = tril(A) - D;

U = triu(A) - D;

for i = 1 : k
    x = inv(L + D) * (- U * x + b);
end