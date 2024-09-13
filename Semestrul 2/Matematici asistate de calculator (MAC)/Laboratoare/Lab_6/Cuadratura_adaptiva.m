function integrala = Cuadratura_adaptiva(f, a0, b0, tol0)

integrala = 0;

n = 1;

a(1) = a0;
b(1) = b0;
tol(1) = tol0;
aproximare(1) = Regula_trapezului(f, a, b);

while n > 0
    c = (a(n) + b(n)) / 2;
    aprox_veche = aproximare(n);

    aproximare(n) = Regula_trapezului(f, a(n), c);
    aproximare(n + 1) = Regula_trapezului(f, c, b(n));

    if abs(aprox_veche - (aproximare(n) + aproximare(n + 1))) < 3 * tol(n)
        integrala = integrala + aproximare(n) + aproximare(n + 1);
        n = n - 1;
    else
        b(n + 1) = b(n);
        b(n) = c;
        a(n + 1) = c;
        tol(n) = tol(n) /2;
        tol(n + 1) = tol(n);
        n = n+ 1;
    end
end

% Cuadratura_adaptiva(@log, 1, 2, 0.5 * 10 ^ (-4))