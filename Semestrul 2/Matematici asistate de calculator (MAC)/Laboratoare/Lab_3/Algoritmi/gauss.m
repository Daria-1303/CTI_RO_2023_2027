function [A, x] = gauss(A, b)

n = length(A);

for j = 1: n -1
    if A(j,j) == 0
        error('Nu avem pivoti');
    end
    
    for i = j + 1 : n
        multi = A(i, j)/ A(j, j);

        for k = j : n
            A(i, k) = A(i, k) - multi * A (j, k);
        end

        b(i) = b(i) - multi * b(j);
    end
end

for i = n : -1 : 1
    for j = i + 1 : n
        b(i) = b(i) - A(i,j) * x(j);
    end
    x(i) = b(i) / A(i,i);
end

% A = [2 1 5; 4 4 -4; 1 3 1];
% b = [9; -8; 4];
% [A,x] = gauss(A,b)