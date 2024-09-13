format long;

f1 = @(x) x./sqrt(x.^2 + 9);

eroare1_16p = Regula_trapezului_compusa(f1, 0, 4, 16) - integral(f1, 0, 4)
eroare1_32p = Regula_trapezului_compusa(f1, 0, 4, 32) - integral(f1, 0, 4)

f2 = @(x) x.^2.*sin(x);

eroare2_16p = Regula_trapezului_compusa(f2, 0, pi, 16) - integral(f2, 0, pi)
eroare2_32p = Regula_trapezului_compusa(f2, 0, pi, 32) - integral(f2, 0, pi)
