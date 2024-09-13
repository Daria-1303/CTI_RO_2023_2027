format long;

x = [- sqrt(3 / 5), 0, sqrt(3 / 5)];

c = [5 /9, 8 / 9, 5 / 9];

f1 =@(x) x.*exp(x);

integrala1 = Cuadratura_gaussiana(f1, x, c, 3)

integrala1_exacta = integral(f1, -1, 1)

eroare1 = integrala1 - integrala1_exacta


f2 = @(x) exp(-1 / 2 * x.^2);

%integrala nu este de la -1 la 1 deci trb aplicata substitutia
% t = (2 * x - a - b) / (b - a) = > sau x = ((b - a) / 2) * x + (b + a) / 2
b = 2;
a = 1;

x = ((b - a) / 2) * x + (b + a) / 2;

% toata integrala trb inmultita cu (b - a) / 2; -> 1 /2

integrala2 = (1/2) * Cuadratura_gaussiana(f2, x, c, 3)

integrala2_exacta = integral(f2, 1, 2)

eroare2 = integrala2 - integrala2_exacta
