function integrala = Regula_mijlocului_compusa(f, a, b, m)

integrala = 0;

h = (b - a) / m;

for i = 1 : m
    integrala = integrala + f(a + ((2 * i - 1) * h) / 2);
end

integrala = integrala * h;