function x = sor(A, b, x0, omega, k)

x = x0;

D = diag(diag(A));

L = tril(A) - D;

U = triu(A) - D;

for i = 1 : k
    x = inv(omega * L + D) * ( (1 - omega) * D * x - omega * U * x) + omega * inv(D + omega * L) * b;
end

%Exemplul 6 curs 4

 % A = [3 1 -1; 2 4 1; -1 2 5];
 % b = [4; 1; 1];
 % omega = 1.2;
 % x0 = zeros(3,1);
 % x = sor(A, b, x0, omega, 20)

%problema 5 lab 3


%problema 9 lab 3