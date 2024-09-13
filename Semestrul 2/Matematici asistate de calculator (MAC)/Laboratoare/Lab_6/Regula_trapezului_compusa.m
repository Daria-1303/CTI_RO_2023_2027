function integrala = Regula_trapezului_compusa(f, a, b, m)

%a, b- capete, m - nr. paneluri

integrala = 0;

h = (b - a) /  m;

for i = 1 : m + 1
    y(i) = f(a + (i - 1) * h);

    if i == 1 || i == m + 1
        integrala = integrala + y(i);
    else
        integrala = integrala + 2 * y(i);
    end
end

integrala = (h / 2) * integrala;