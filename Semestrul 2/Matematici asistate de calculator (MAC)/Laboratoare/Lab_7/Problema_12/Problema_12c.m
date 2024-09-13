function [t, w] = p_AB_3_c_AM_2(interval, y0, n, s)

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

    w(i + 1, :) = ab3step(t(i), i, w, f, h);

    %corector
    f(i + 1, :) = ydot(t(i + 1), w(i + 1, :));

    w(i + 1, :) = am2step(t(i), i, w, f, h);
end

plot(t, w);


function w = trapezstep(t, w, h)

w = w + h / 2 * (ydot(t, w) + ydot(t + h, w + h * ydot(t, w)));

function z = ab3step(t, i, w, f, h)

z = w(i, :) + h / 12 * (23 * f(i, :) - 16 * f(i - 1, :) + 5 * f(i - 2, :));

function z = am2step(t, i, w, f, h)

z = w(i, :) + h / 12 * (5 * f(i + 1, :) + 8 * f(i, :) - f(i - 1, :));

function z = ydot(t, w)

z = (t ^ 3) / (w ^ 2);