omega = 1.2;

x0 = [0; 0; 0];

A1 = [-5 1 -2; 1 -3 1; 2 1 -4];

b1 = [6; -2; -7];

gs1 = gauss_seidel(A1, b1, x0, 20)
omega = 1.2;

x0 = [0; 0; 0];

so1 = sor(A1, b1, x0, omega, 20)
rezultat1 = A1 \ b1

omega = 1.2;

x0 = [0; 0; 0];

A3 = [3 -1 1; 1 -8 -2; 1 1 5];
b3 = [-2; 1; 4];

gauss_seidel(A3, b3, x0, 20)
omega = 1.2;

x0 = [0; 0; 0];
sor(A3, b3, x0, omega, 20)
rezultat3 = A3 \ b3

omega = 1.2;

x0 = [0; 0; 0];

A6 = [4 -2 3; -2 2 -1; 3 -1 5];
b6 = [1; -2; 4];

conjgrad(A6, b6, x0, 20)
rezultat6 = A6 \ b6