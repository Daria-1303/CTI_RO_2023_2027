function y = nested(d, c, x, b)

%nargin returneaza nr de argumente primite de functie

if nargin < 4
    b = zeros(d, 1);
end

y = c(d + 1);

for i = d : -1 : 1
    y = y .* (x - b(i)) + c(i);
end

%functie pentru calculul valorii polinomului de interpolare

% x=0:0.01:4;
% y=nested(2,c,x,x0);
% plot(x0,y0,'o',x,y)