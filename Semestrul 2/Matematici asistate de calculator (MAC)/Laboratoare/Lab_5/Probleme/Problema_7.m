t0=[-2;0;1;2];
y0=[1;2;2;5];

A = [ones(length(t0), 1), t0];

b = log(y0);

x = (A' * A) \ (A' * b)

c1 = exp(x(1));
c2 = x(2);

y_aprox = c1 * exp(c2 * t0);

% r_normal  = b - A * x;
% 
% norma = norm(r_normal)

r = y0 - y_aprox;

norm(r)
