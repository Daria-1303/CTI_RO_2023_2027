format long

f1 = @(x) (2 * x ^ 3 - 6 * x - 1);

f2 = @(x) x ^ 5 + x - 1;

f3 = @(x) x ^ 3 - 2 * x - 2;

sec1 = secant(f1, -2.3, -1, 10)
met_f1 = mfp(f1, -2, -1, 20)
fzero(f1,-1.5)

sec2 = secant(f1, 0.5, 1, 10)
met_f2 = mfp(f1, -1, -0, 20)
fzero(f1,-1)

sec3 = secant(f1, 1, 1.7, 10)
met_f3 = mfp(f1, 1, 2, 20)
fzero(f1,1.5)

sec4 = secant(f2, 1.6, 2.5, 10)
met_f4 = mfp(f2, 0, 1, 20)
fzero(f2,0.7)


sec5 = secant(f3, 2.2, 2.7, 20)
met_f5 = mfp(f3, 1, 2, 20)
fzero(f3,1.77)