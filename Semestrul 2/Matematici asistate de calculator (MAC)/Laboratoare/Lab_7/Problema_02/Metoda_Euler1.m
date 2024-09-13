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

z = 1 / (w ^ 2);

% h = 0.1;
% [t, w] = Metoda_Euler1([0, 1], 1, 10);
% yy = @(t) (t* 3 + 1) .^ ( 1 / 3);
% 
% int = 0 : 0.1 : 1;
% 
% eroare = [yy(int) - w];
% 
% [t; w; eroare]'

% h = 0.05;
% [t, w] = Metoda_Euler1([0, 1], 1, 20);
% yy = @(t) (t* 3 + 1) .^ ( 1 / 3);
% 
% int = 0 : 0.05 : 1;
% 
% eroare = [yy(int) - w];
% 
% [t; w; eroare]'

% h = 0.025;
% [t, w] = Metoda_Euler1([0, 1], 1, 40);
% yy = @(t) (t* 3 + 1) .^ ( 1 / 3);
% 
% int = 0 : 0.025 : 1;
% 
% eroare = [yy(int) - w];
% 
% [t; w; eroare]'