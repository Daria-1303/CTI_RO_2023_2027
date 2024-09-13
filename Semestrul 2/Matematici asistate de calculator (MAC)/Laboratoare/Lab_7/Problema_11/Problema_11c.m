function [t, w] = Metoda_AB_3pasi_RK_4(interval, y0, n, s)

t(1) = interval(1);

w(1, :) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : (s - 1)
    t(i + 1) = t(i) + h;

    w(i + 1, :) = rk4step(t(i), w(i, :), h);

    f(i, :) = ydot(t(i), w(i, :));
end

for i = s : n
    t(i + 1) = t(i) + h;

    f(i, :) = ydot(t(i), w(i, :));

    w(i + 1, :) = ab3step(t(i), i, w, f, h);
end

plot(t, w);

function w = rk4step(t, w, h)

s1 = ydot(t, w);

s2 = ydot(t + h/2, w + h/2 * s1);

s3 = ydot(t + h/2, w + h/2 * s2);

s4 = ydot(t + h, w + h * s3);

s = s1 + 2 * s2 + 2 * s3 + s4;

w = w + h / 6 * s;

function z = ab3step(t, i, w, f, h)

z = w(i, :) + h / 12 * (23 * f(i, :) - 16 * f(i - 1, :) + 5 * f(i - 2, :));

function z = ydot(t, w)

z = (t ^ 3) / (w ^ 2);