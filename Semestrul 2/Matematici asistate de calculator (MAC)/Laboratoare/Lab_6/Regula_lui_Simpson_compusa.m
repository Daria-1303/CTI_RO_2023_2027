function integrala = Regula_lui_Simpson_compusa(f, a, b, m)

integrala = 0;

h = (b - a) / (2 * m);

sum_2i_1 = 0;
sum_2i = 0;

for i = 1 : m
    yi = f(a + (2 * i - 1) * h);
    sum_2i_1 = sum_2i_1 + yi;
end

for i = 1 : m - 1
    yi = f(a + (2 * i) * h);
    sum_2i = sum_2i + yi;
end

y0 = f(a);
y2m = f(b);

integrala = (h / 3) * (y0 + y2m + 4 * sum_2i_1 + 2 * sum_2i);