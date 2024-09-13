x0 = [-3;-1;0;1;3];
y0 = [3;2;1;-1;-4];

A = [ones(length(x0), 1), x0, x0.^2];

b = y0;

coeff = (A' * A) \ (A' * b)

r = b - A * coeff;

norma = norm(r);

REMP = norma / sqrt(length(r))

c = polyfit(x0, y0,2);

x = -4 : 0.01 : 4;

y = polyval(c, x);

plot(x0, y0, 'o', x, y);