% implica aproximarea derivatei sau integralei unei functii
syms x;

f = sin(x);

df = matlabFunction(diff(f))

pf = matlabFunction(int(f))