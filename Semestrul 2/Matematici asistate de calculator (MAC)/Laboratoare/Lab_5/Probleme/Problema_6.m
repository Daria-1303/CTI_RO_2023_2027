t0 = [0;1/6;1/3;1/2;2/3;5/6];
y0 = [0;2;0;-1;1;1];

A1 = [ones(length(t0),1), cos(2*pi*t0) sin(2*pi*t0)];
A2 = [ones(length(t0),1), cos(2*pi*t0) sin(2*pi*t0) cos(4*pi*t0)];

b1 = [0;2;0;-1;1;1];

x1 = (A1' * A1) \ (A1' * b1)

r1 = b1 - A1 * x1;

norm(r1)

x2 = (A2' * A2) \ (A2' * b1)

r2 = b1 - A2 * x2;

norm(r2)
