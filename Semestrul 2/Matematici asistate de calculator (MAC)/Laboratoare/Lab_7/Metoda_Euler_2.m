function [t, w] = Metoda_Euler2(interval, y0, n)

% w este tratat ca un vector

t(1) = interval(1);

w(1, :) = y0;

h = (interval(2) -  interval(1)) / n;

for i = 1 : n
    t(i + 1) = t(i) + h;

    w(i + 1, :) = eulerstep(t(i), w(i, :), h);
end

plot(t, w(:, 1), t, w(:, 2));


function w = eulerstep(t, w, h)

w = w + h * ydot2(t, w);


function z = ydot2(t, w)

% ex de la Ionut
z(1) = w(1) + 3 * w(2);
z(2) = 2 * w(1) + 2 * w(2);

% ex de pe laborator
% z(1) = w(2)^2 - 2 * w(1);
% z(2) = w(1) - w(2) - t * w(2)^2;

% [t,w] = Metoda_Euler_2([0 1], [0 1], 10)