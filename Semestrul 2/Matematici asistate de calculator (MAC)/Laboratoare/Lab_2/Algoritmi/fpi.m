function xc = fpi(g, x0, k)

x = x0;

for i = 1 : k
    x = g (x);
end

xc = x;