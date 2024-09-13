function lambda=unshiftedqr(A,k)
[m,n]=size(A);
Q=eye(m,m);
R=A;
for j=1:k
[Q,R]=qr(R*Q);
end
lambda=diag(R*Q);