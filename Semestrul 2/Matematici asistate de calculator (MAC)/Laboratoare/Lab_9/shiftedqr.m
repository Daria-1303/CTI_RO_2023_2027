function lambda=shiftedqr(A)
tol=1e-14;
m=size(A,1);
lambda=zeros(m,1);
n=m;
while n>1
while max(abs(A(n,1:n-1)))>tol
s=A(n,n);
[Q,R]=qr(A-s*eye(n));
A=R*Q+s*eye(n);
end
lambda(n)=A(n,n);
n=n-1;
A=A(1:n,1:n);
end
lambda(1)=A(1,1);