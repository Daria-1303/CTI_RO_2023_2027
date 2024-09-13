function x = broyden2(F, x0, k)

n = length(x0);

B = eye(n,n);

for i = 1 : k
    x = x0 - B * F(x0);

    delta = x - x0;
    DELTA = F(x) - F(x0);

    B = B + ( ( delta - B * DELTA) * delta' * B) / (delta' * B * DELTA);

    x0 = x;
end



% Lab 3
% F=@(x) [x(2)-x(1)^3;x(1)^2+x(2)^2-1];
% x=broyden2(F,[1;1],10)