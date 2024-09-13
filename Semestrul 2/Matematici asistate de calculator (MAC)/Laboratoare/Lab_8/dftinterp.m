function xp=dftinterp(inter,x,n,p)
c=inter(1);
d=inter(2);
t=c+(d-c)*(0:n-1)/n;
tp=c+(d-c)*(0:p-1)/p;
y=fft(x);      % -> n
yp=zeros(p,1);

yp(1:n/2+1)=y(1:n/2+1);
yp(p-n/2+2:p)=y(n/2+2:n);
xp=real(ifft(yp))*(p/n);
plot(t,x,'o',tp,xp)

% dftinterp([0, 1], [-2.2 -2.8 -6.1 -3.9 0.0 1.1 -0.6 -1.1],8,100)

% interp = [c, d]




