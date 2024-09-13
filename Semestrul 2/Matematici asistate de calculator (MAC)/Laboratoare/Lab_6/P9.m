format long;

f1 = @(x) (x./sqrt(x.^4 + 1));

integrala1 = C_adaptiva_noua(f1, 0, 1, 0.5 * 10 ^ (-8))
% integrala1_2 = Cuadratura_adaptiva(f1, 0, 1, 0.5 * 10 ^ (-8))
integrala1_exacta = integral(f1, 0, 1)

eroare1 = integrala1 - integrala1_exacta

f2 = @(x)(1./sqrt(x.^2 + 4));

integrala2 = C_adaptiva_noua(f2, 0, 2 * sqrt(3), 0.5 * 10 ^ (-8))
integrala2_exacta = integral(f2, 0, 2 * sqrt(3))

eroare2 = integrala2 - integrala2_exacta