function [t, w] = exmultistep(interval, y0, n, s)

h = (interval(2) - interval(1)) / n;

w(1, :) = y0;

t(1) = interval(1);

for i = 1 : s -1 
    t(i + 1) = t(i) + h;

    w(i + 1, :) = trapez_explicit_step(t(i), w(i, :), h);

    f(i, :) = ydot(t(i), w(i, :));
end

for i = s : n
    t(i + 1) = t(i) + h;

    f(i, :) = ydot(t(i), w(i, :));

    w(i + 1, :) =  unstable2step(t(i), i, w, f, h);
end

plot(t, w);


function w = trapez_explicit_step(t, x, h)

z1 = ydot(t, x);

g = x + h * z1;

z2 = ydot(t + h, g);

w = x + h * (z1 + z2) / 2;

function z = unstable2step(t, i, w, f, h)

z = -w(i, :) + 2 * w(i - 1, :) + h * (5 * f(i, :) / 2 + f(i - 1, :) / 2); 

function z = ydot(t, w)

z = 2 * (t + 1) * w;