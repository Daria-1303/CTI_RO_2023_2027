a = -1;
b = 1;

x0 = cebisev(a, b, 6);

y0 = exp(x0);

c = newtondd(x0, y0, 6)

x = -1 : 0.1 : 1;

y = nested(5, c, x, x0);

subplot(121);
plot(x0, y0, 'o', x,y);

subplot(122);
plot(x, exp(x));