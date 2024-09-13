function xmin = Metoda_lui_Newton(g, H, x, k)

% x -> vector initial
% k -> nr de pasi

for i = 1 : k
    x = x - H(x) \ g(x);
end

xmin = x;
end