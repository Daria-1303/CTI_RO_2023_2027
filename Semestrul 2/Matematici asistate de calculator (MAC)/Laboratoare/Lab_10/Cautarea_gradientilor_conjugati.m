function x = Cautarea_gradientilor_conjugati(g, f, x, k)

d = - g(x);

r = d;

for i = 1 : k
    alfa = fminbnd(@(alfa) f(x + alfa * d), 0, 1);

    x = x + alfa * d;

    r_nou = - g(x);

    beta = (r_nou' * r_nou)/ (r' * r);

    d = r_nou + beta * d;

    r = r_nou;
end
end
