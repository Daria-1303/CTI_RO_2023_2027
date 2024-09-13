x0 = [-3;-1;0;1;3];

y0=[3;2;1;-1;-4];

A = [ones(length(x0), 1), x0];
% A = [1 -3; 1 -1; 1 0; 1 1; 1 3];

b = y0;

x = (A' * A) \ (A' * b)

r = b - A * x;

norma = norm(r)

REMP = norma / sqrt(length(r))

c = polyfit(x0, y0, 1)

x1 = -4: 0.01 : 4;

y = polyval(c, x1);

plot(x0, y0, 'o', x1, y)




