format short;

f=@(x,y) exp(-x^2*y^2)+(x-1)^2+(y-1)^2;
%ezsurf(f)
%ezmesh(f)

f=@(x) exp(-x(1)^2*x(2)^2)+(x(1)-1)^2+(x(2)-1)^2;

g = @(x) [exp(-x(1)^2*x(2)^2) * (- 2 * x(1) ) + 2 * x(1) - 2 ; exp(-x(1)^2*x(2)^2) * (- 2 * x(2) ) + 2 * x(2) - 2 ];

H = @(x)[exp(-x(1)^2*x(2)^2) * 4 * x(1)^2 + 2, exp(-x(1)^2*x(2)^2) * 4 * x(1) * x(2); exp(-x(1)^2*x(2)^2) * 4 * x(1) * x(2), exp(-x(1)^2*x(2)^2) * 4 * x(2)^2 + 2];

xmin = Metoda_lui_Newton(g, H, [1; 1], 10)

minime = fminsearch(f, [1;1])