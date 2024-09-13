x0 = [-1; 0 ; 1; 2];
y0 = [1; 0; 0; -2];

c = polyfit(x0, y0, 2);

x = -1: 0.01 : 2;

y = polyval(c, x);

plot(x0, y0, 'o', x, y);