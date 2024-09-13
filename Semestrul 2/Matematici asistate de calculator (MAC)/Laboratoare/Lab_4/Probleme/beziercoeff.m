function coeff = bezziercoeff(x,y)

bx = 3* (x(2) - x(1));

cx = 3 *(x(3) - x(2)) - bx;

dx = x(4) - x(1) - bx - cx;

by = 3* (y(2) - y(1));

cy = 3 *(y(3) - y(2)) - by;

dy = y(4) - y(1) - by - cy;

coeff = zeros(2, 4);

coeff(1, :) = [x(1), bx, cx, dx];
coeff(1, :) = [y(1), by, cy, dy];