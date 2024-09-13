function [Q, R] = Problema_8(A);

[m, n] = size(A);

for j = 1 : n
    y = A(:, j);
    Q(:, j) = y / norm(y);

    for i = 1 : j-1
        R(i, j) = Q(:, i)' * A(:, j);
        y = y - R(i, j) * Q(:,i);
    end

    R(j,j) = norm(y);
    Q(:, j) = y / R(j,j);
end

% A=[2 1;1 -1;2 1];
% A=[4 8 1;0 2 -2;3 6 7];