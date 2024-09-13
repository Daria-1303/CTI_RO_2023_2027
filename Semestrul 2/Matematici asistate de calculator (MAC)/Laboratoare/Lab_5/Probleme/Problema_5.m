t0 = ([1;2;3;4;5;6;7;8;9;10;11;12]-1)/12;

y0=[6.224;6.665;6.241;5.302;5.073;5.127;4.994;5.012;5.108;5.377;5.510;6.372];

A = [ones(length(t0), 1), cos(2*pi*t0) , sin(2*pi*t0), cos(4*pi*t0)];

b = y0;

coeff = (A' * A) \ ( A' * b)

r = b - A * coeff;

norma = norm(r);

REMP = norma / sqrt(length(r))