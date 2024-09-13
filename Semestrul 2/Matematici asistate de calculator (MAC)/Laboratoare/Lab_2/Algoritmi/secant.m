function xc = secant(f, x0, x1, k)

x = x0;
y = x1;

for i = 1 : k
    z = y - (f(y) * (y - x)/(f(y) - f(x)));
    x = y;
    y = z;
end

xc = z;

% f = @(x) x ^ 5 + x - 1;
% x = secant(f, 1.6, 2.5, 10)