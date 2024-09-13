format long;

f1 = @(x) x./sin(x);

eroare1_16p = Regula_mijlocului_compusa(f1, 0, pi/2, 16) - integral(f1, 0, pi/2)
eroare1_32p = Regula_mijlocului_compusa(f1, 0, pi/2, 32) - integral(f1, 0, pi/2)

f2 = @(x) (exp(x) - 1)./sin(x);

eroare2_16p = Regula_mijlocului_compusa(f2, 0, pi/2, 16) - integral(f2, 0, pi/2)
eroare2_32p = Regula_mijlocului_compusa(f2, 0, pi/2, 32) - integral(f2, 0, pi/2)