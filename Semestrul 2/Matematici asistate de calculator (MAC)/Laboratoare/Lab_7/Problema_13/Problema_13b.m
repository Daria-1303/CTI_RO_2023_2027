function [t, w] = p_AB_4_c_AM_3(interval, y0, n, s)

t(1) = interval(1);

w(1, :) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : (s - 1)
    t(i + 1) = t(i) + h;

    w(i + 1, :) = trapezstep(t(i), w(i, :), h);

    f(i, :) = ydot(t(i), w(i, :));
end

for i = s : n
    t(i + 1) = t(i) + h;

    f(i, :) = ydot(t(i), w(i, :));

    w(i + 1, :) = ab4step(t(i), i, w, f, h);

    %corector
    f(i + 1, :) = ydot(t(i + 1), w(i + 1, :));

    w(i + 1, :) = am3step(t(i), i, w, f, h);
end

plot(t, w);


function w = trapezstep(t, w, h)

w = w + h / 2 * (ydot(t, w) + ydot(t + h, w + h * ydot(t, w)));

function z = ab4step(t, i, w, f, h)

z = w(i, :) + h / 24 * (55 * f(i, :) - 59 * f(i - 1, :) + 37 * f(i - 2, :) - 9 * f(i - 3, :));

function z = am3step(t, i, w, f, h)

z = w(i, :) + h / 24 * (9 * f(i + 1, :) +19 * f(i, :) - 5 * f(i - 1, :) + f(i - 2, :));

function z = ydot(t, w)

z = 2 * (t + 1) * w;