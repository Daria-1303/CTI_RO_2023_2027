A = [4 -2 3; -2 2 -1; 3 -1 5];

%este simetrica
A == A'

%este pozitiv definita
eig(A) > 0