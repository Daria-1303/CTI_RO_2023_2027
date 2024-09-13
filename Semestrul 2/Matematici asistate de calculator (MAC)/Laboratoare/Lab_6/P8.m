format long;

f1 = @(x) x.*exp(x);
n = 5;

integrala_aproximata1 = Integrarea_Romberg(f1, 0, 1, n);
integrala_aproximata1(n, n)
integrala_exacta1 = integral(f1, 0, 1)

eroare1 = integrala_aproximata1(n, n) - integrala_exacta1


f2 = @(x) x.^2.*log(x);
n = 5;

integrala_aproximata2 = Integrarea_Romberg(f2, 1, 3, n);
integrala_aproximata2(n, n)
integrala_exacta2 = integral(f2, 1, 3)

eroare2 = integrala_aproximata2(n, n) - integrala_exacta2
