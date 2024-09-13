function [lambda,u]=invpowerit(A,x,s,k)
As=A-s*eye(size(A));
for j=1:k
u=x/norm(x);
x=As\u;
lambda=u'*x;
end
lambda=1/lambda+s;
u=x/norm(x);