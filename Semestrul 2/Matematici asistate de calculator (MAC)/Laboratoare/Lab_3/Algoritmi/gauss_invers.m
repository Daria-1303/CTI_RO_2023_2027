function [A,x] = gauss_invers(A, b)

n = length(A);

for i = n : 1
    for j = i + 1 : n
        b(i) = b(i) - A(i, j) * x(j);
    end

    x(j) = b(i)/ A(i, i);
end