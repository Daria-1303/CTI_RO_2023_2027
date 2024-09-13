function [t,w] = p_AB_2_c_AM_1(inter, y0, n, s)

h = (inter(2) - inter(1)) / n;

w(1, :) = y0;

t(1) = inter(1);

for i = 1 : s - 1
    t(i + 1) = t(i) + h;

    w(i + 1, :) = trapezstep(t(i), w(i, :), h);

    f(i, :) = ydot(t(i), w(i,:));
end

for i = s : n
    t(i + 1) = t(i) + h;

    f(i,:)=ydot(t(i),w(i,:));

    w(i + 1, :) = ab2step(t(i), i, w, f, h);

    f(i + 1, :) = ydot(t(i + 1), w(i + 1, :));

    w(i + 1, :) = am1step(t(i), i, w, f, h);
end

plot(t,w)

function w = trapezstep(t, w, h)

w = w + h / 2 * (ydot(t, w) + ydot(t + h, w + h * ydot(t, w)));


function z = ab2step(t, i, w, f, h)

z = w(i, :) + h * (3 * f(i, :) / 2 - f(i - 1, :)/2); 


function z = am1step(t, i, w, f, h)

z = w(i, :) + h * (f(i+1, :) + f(i, :)) / 2;

function z = ydot(t, w)

z = 1 / (w ^ 2);

% [t,y]=predcorr([0 1],1,20,2);
