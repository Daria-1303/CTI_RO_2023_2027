format long

f = @(x) x ^ 3 - 2 * x - 2;

df = @(x) 3 * x ^ 2 - 2;

x0 = 1;

newton(f, df, x0, 20)