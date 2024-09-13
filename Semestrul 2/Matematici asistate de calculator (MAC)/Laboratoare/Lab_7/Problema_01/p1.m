% yderiv(t) = f(t, y(t))
% y' = 4t + 2y

% cu val init -> y' = f(t, y) y(a) = yinit / t din [A, B)

% deriv -> rata de modificare a functiei in timp

function [t, w] = p1(interval, y0, n)

t(1) = interval(1);

w(1) = y0;

h = (interval(2) - interval(1)) / n;

for i = 1 : n
   
    t(i + 1) = t(i) + h;
    w(i + 1) = trapezstep(t(i), w(i), h);

end

plot(t, w)


function z = ydot(t, w)

% z = t * w + t ^ 3;

z = 1 / (w ^ 2);

% z = 2 * (t + 1) * w;

% z = t^3 / (w ^ 2);

% y' = ty + t^3


function w = eulerstep(t, w, h)

w = w + h * ydot(t, w);



function  w = trapezstep(t, w, h)

% w = w + h * ydot(t, w);

w = w + (h / 2) * (ydot(t, w) + ydot(t + h, w + h * ydot(t, w))); 



function w = mijlocstep(t, w, h)

w = w + h * ydot(t + h / 2, w + h / 2 * ydot(t, w));

