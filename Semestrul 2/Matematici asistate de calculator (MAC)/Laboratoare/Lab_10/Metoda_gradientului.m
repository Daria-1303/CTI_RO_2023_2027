function x = Metoda_gradientului(g, f, x, k)

for i = 1 : k
    v = g(x);
    s = fminbnd(@(s) f(x - s * v), 0, 1);
    x = x - s * v;
end
end
