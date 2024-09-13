x0 = [1994;1995;1996;1997;1998;1999;2000;2001;2002;2003]-1994;

y0=[67.052;68.008;69.803;72.024;73.400;72.063;74.669;74.487;74.065;76.777];

A1 = [ones(length(x0), 1), x0];

b = y0;

coeff1 = (A1' * A1)\(A1' * b)

r1 = b - A1 * coeff1;

aprox1 = coeff1(1) + coeff1(2) * (2018 - 1994)

norma1 = norm(r1);
REMP1 = norma1 / sqrt(length(r1)) 

A2 = [ones(length(x0), 1), x0, x0.^2];

b = y0;

coeff2 = (A2' * A2) \ (A2' * b)

r2 = b - A2 * coeff2;

aprox2 = coeff2(1) + coeff2(2) * (2018 - 1994) + coeff2(3) * (2018 - 1994) ^2

norma2 = norm(r2);

REMP2 = norma2 / (sqrt(length(r2)))

A3 = [ones(length(x0), 1), x0, x0.^2, x0.^3];

b = y0;

coeff3 = (A3' * A3) \ (A3' * b)

r3 = b - A3 * coeff3;

aprox3 = coeff3(1) + coeff3(2) * (2018 - 1994) + coeff3(3) * (2018 - 1994) ^2 + coeff3(4) * (2018 -1994)^3

norma3 = norm(r3);

REMP3 = norma3 / (sqrt(length(r3)))

