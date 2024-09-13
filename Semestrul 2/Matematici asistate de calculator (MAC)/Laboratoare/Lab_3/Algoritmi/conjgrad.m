function x = conjgrad(A, b, x0, k)

x = x0;

d = b - A * x0;

r = d;

for i = 1 : k
    if r == 0
        break;
    end

    alfa = (r' * r) / (d' * A * d);

    x = x + alfa * d;
    r_nou = r - alfa * A * d;

    beta = (r_nou' * r_nou) / (r' * r);

    d = r_nou + beta * d;

    r = r_nou;
    
end

% Exemplul 9 curs 4
% A = [2 2; 2 5];
% b = [6;3];
% x0 = zeros(2,1);
% x = conjgrad(A, b, x0, 20)