x0 = [0.6 0.7 0.8 0.9 1.0];
y0=[1.433329 1.632316 1.896481 2.247908 2.718282];

c = newtondd(x0, y0, length(x0))

x = 0: 0.1 : 2;

y = nested(length(x0) - 1, c, x, x0);

plot(x0, y0, 'o', x, y);

