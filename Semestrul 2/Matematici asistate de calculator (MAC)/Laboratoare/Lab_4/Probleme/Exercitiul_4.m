a = 0;
b = pi / 2;

x0 = cebisev(a, b, 4);
y0 = sin(x0);

c = newtondd(x0, y0, 4)

x = -2: 0.1 : 2;

y = nested(3, c, x, x0);

plot(x0, y0,'o',x, y );