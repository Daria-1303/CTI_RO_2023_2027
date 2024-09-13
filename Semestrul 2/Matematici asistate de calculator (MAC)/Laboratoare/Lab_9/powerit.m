function [lambda,u]=powerit(A,x,k)
for j=1:k
u=x/norm(x);
x=A*u;
lambda=u'*x;
end
u=x/norm(x);