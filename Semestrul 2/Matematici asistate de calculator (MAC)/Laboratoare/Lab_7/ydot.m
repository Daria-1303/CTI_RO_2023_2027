function z = ydot(t,w)

z(1) = w(1) + 3 * w(2);
z(2) = 2 * w(1) + 2 * w(2);

%z=t*(1 / (y ^ 2))+t^3;

% pt problema 1 y =  (1 / (y ^ 2));

% pt sol exacta
% yy = @(t) (t* 3 + 1) .^ ( 1 / 3);
% int = 0 : 0.1 : 1
% eroare = [y(int) - y]