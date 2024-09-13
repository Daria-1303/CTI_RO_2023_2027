F = @(x) [x(1)^2 + 4*x(2)^2 - 4; 4*x(1)^2 + x(2)^2 - 4];

DF = @(x) [2*x(1) 8*x(2); 8*x(1) 2*x(2)];

x0 = [1; 1];

k = 7;

rez_newton= newton(F, DF, x0, k)

x0 = [1; 1];

rez_broyden1 = broyden(F, x0, k)

x0 = [1; 1];

fsolve(F, x0)