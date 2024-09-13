function x = broyden(F, x0, k)

n = length(x0);

A = eye(n,n); 
% asta face 1 pe diagonala principala


for i = 1 : k
    x = x0 - inv(A) * F(x0);
    
    delta = x - x0;

    DELTA = F(x) - F(x0);

    A = A + ((DELTA - A * delta) * delta') / (delta' * delta);

    x0 = x;
end

% ex lab 3
% F=@(x) [x(2)-x(1)^3;x(1)^2+x(2)^2-1];
% x=broyden(F,[1;1],10)