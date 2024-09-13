A=[10 -12 -6;5 -5 -4;-1 0 3];

[lambda,u]=powerit(A,[-5;5;2],40)

[V,D] = eig(A)