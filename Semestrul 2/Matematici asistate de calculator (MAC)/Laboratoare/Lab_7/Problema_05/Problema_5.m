function [t, w] = Problema_5(interval, y0, n)

t(1) = interval(1);

w(1, :) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : n

    t(i + 1) = t(i) + h;

    w(i + 1, :) = eulerstep(t(i), w(i, :), h);
end

plot(t, w(:, 1), t, w(:, 2));


function w = eulerstep(t, w, h)

w = w + h * ydot(t, w);


function z = ydot(t, w)

z(1) = w(1) + 3 * w(2);
z(2) = 2 * w(1) + 2 * w(2);