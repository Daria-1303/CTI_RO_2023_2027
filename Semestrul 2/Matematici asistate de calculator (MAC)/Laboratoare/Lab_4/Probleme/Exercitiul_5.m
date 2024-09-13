a = 0;
b = 2 * pi;

x0 = cebisev(a, b, 11);

y0 = cos(x0);

c = newtondd(x0, y0, 11)

x = 0 : 0.1 : 2 * pi;

y = nested(10, c, x, x0);

subplot(121);
plot(x0,y0, 'o',x,y);

subplot(122);
plot(x, cos(x));