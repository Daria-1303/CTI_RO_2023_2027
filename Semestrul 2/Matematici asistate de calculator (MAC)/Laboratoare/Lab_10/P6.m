format short;

f=@(x) x(1)^4+x(2)^4+2*x(1)^2*x(2)^2+6*x(1)*x(2)-4*x(1)-4*x(2)+1;

g = @(x) [4 * x(1)^3 + 4 * x(1) * x(2)^2 + 6 * x(2) - 4; 4 * x(2)^3 + 4 * x(1)^2 * x(2) + 6 * x(1) - 4];

xmin = Cautarea_gradientilor_conjugati(g, f, [0; 1], 10)

minime = fminsearch(f, [1;1])