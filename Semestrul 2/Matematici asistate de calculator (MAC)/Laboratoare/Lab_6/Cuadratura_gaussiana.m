function integrala = Cuadratura_gaussiana(f, x, c, n)

sum = 0;

for i = 1 : n
    sum = sum + c(i) * f(x(i));
end

integrala = sum;