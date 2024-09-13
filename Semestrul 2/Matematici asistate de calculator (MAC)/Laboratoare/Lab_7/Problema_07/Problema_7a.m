function [t, w] = Metoda_Runge_Kutta_ordin_4(interval, y0, n)

t(1) = interval(1);
w(1) = y0;

h  = (interval(2) - interval(1)) / n;

for i = 1 : n
    t(i + 1) = t(i) + h;

    w(i + 1) = rkstep(t(i), w(i), h);
end

plot(t, w)


function w = rkstep(t, w, h)

s1 = ydot(t, w);

s2 = ydot(t + h/2, w + h/2 * s1);

s3 = ydot(t + h/2, w + h/2 * s2);

s4 = ydot(t + h, w + h * s3);

s = s1 + 2 * s2 + 2 * s3 + s4;

w = w + h / 6 * s;

function z = ydot(t, w)

z = 1 / (w ^ 2);