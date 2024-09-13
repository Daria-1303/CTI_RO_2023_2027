A=[10 -12 -6;5 -5 -4;-1 0 3];

[lambda1,u1]=invpowerit(A,[1;1;1],1.95,20);
[lambda2,u2]=invpowerit(A,[1;1;1],2.05,20);
lambda1
lambda2