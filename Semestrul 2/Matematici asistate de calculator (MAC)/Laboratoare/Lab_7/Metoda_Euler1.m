function [t, w] = Metoda_Euler1(interval, y0, n)

t(1) = interval(1);

w(1) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : n
    t(i + 1) = t(i) + h;
    w(i + 1) = eulerstep(t(i), w(i), h);
end

plot(t, w)

function w = eulerstep(t, w, h)

w = w + h * ydot(t, w);

function z = ydot(t, w)

% este functia de la y'

z = t * w + t^3;

% [t,w] = euler1([0 1],1,10);