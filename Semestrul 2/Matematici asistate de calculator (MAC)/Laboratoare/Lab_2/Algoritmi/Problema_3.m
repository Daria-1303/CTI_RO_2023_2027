format long

f = @(x) x ^ 5 + x - 1;

g = @(x) (1 - x) ^ (1/5);

fpi(g, 0.8, 10)