function x = cebisev(a, b, n)

for i = 1 : n
    x(i) = (b + a) / 2 + ((b - a) / 2) * cos( ((2 * i - 1)* pi) / (2 * n)) ;
end

% x0 = cebisev(0, pi/2, 5);
% y0 = cos(x0);
% c = newtondd(x0,y0,5)