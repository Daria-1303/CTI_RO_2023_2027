format short;

f = @(x) (3 * x^4 + 4 * x^3 - 24 * x^2 + 5);

xmin1 = Sectiunea_de_aur(f, -3, -2, 7)

min1 = fminbnd(f, -3, -2)

xmin2 = Sectiunea_de_aur(f, 1, 2, 4)

min2 = fminbnd(f, 1, 2)

xmin3 = Sectiunea_de_aur(f, -4, -3, 4)

min3 = fminbnd(f, -4, -3)

xmin4 = Sectiunea_de_aur(f, 0, 1, 4)

min4 = fminbnd(f, 0, 1)
