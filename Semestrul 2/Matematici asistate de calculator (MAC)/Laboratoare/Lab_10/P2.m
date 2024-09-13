format short;

f = @(x) (3 * x^4 + 4 * x^3 - 24 * x^2 + 5);

xmin1 = Interpolarea_parabolica_succesiva(f, -3, -2.5 ,-2, 7)

min1 = fminbnd(f, -3, -2)

xmin2 = Interpolarea_parabolica_succesiva(f, 1, 1.5, 2, 4)

min2 = fminbnd(f, 1, 2)

xmin3 = Interpolarea_parabolica_succesiva(f, -4, -3.5, -3, 1)

min3 = fminbnd(f, -4, -3)

xmin4 = Interpolarea_parabolica_succesiva(f, 0, 0.5, 1, 2)

min4 = fminbnd(f, 0, 1)
