function xc = newton(f, df, x0, k)

x = x0;

for i = 1 : k
    x = x - f(x)/df(x);
end
xc = x;