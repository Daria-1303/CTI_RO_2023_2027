function [t, w] = Metoda_trapez_explicita(interval, y0, n)

t(1) = interval(1);

w(1) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : n

    t(i + 1) = t(i) + h;

    w(i + 1) = trapezstep(t(i), w(i), h);
end

plot(t, w);

function w = trapezstep(t, w, h)

w = w + h / 2 * (ydot(t, w) + ydot(t + h, w + h * ydot(t, w)));

function z = ydot(t, w)

z = (t ^ 3) / (w ^ 2);