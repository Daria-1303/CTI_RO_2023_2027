function yc = tcdinter2d(n, x)

c = zeros(n, n);

for i = 1 : n
    for j = 1 : n
        c(i, j) = cos((i - 1) * ( 2 * j - 1) * pi / (2 * n));
    end
end

c = sqrt(2 / n) * c;

c(1, :) = c( 1, :) / sqrt(2);

y = c.* x;

yc = y.'*c.';   

% yc = tcdinter2d(4, [-1 1 -1 1; -2 2 -2 2; -3 3 -3 3; -4 4 -4 4])