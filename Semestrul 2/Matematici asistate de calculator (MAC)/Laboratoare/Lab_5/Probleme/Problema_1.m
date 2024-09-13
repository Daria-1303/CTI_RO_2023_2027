A=[3 -1 2;4 1 0;-3 2 1;1 1 5;-2 0 3];
b=[10;10;-5;15;0];

x = (A' * A) \ (A' * b)

% A * x = b

r = b - A * x;

%pt 2-norma
n = norm(r)

REMP = n / sqrt(length(r))

% remp = radacina erorii medii patratice

