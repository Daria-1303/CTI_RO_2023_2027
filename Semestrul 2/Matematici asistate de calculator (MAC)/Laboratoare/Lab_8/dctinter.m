function [c, y] = dctinter(n, x)

c = zeros(n, n);

for i = 1 : n
    for j = 1 : n
        c(i, j) = cos((i - 1) * ( 2 * j - 1) * pi / (2 * n));
    end
end

c = sqrt(2 / n) * c;

c(1, :) = c( 1, :) / sqrt(2);

y = c * x;


% y = dctinter(8, [3; 5; -1; 3; 1; 3; -2; 4])