format long


f = @(x) (2 * x ^ 3 - 6 * x - 1);

metoda_bisectiei(f,-2, -1,0.00005)

metoda_bisectiei(f,-1, 0,0.00005)

metoda_bisectiei(f,1,2,0.00005)