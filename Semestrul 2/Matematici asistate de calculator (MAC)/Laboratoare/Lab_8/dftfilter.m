function xp=dftfilter(inter,x,m,n,p)
c=inter(1);
d=inter(2);
t=c+(d-c)*(0:n-1)/n;
tp=c+(d-c)*(0:p-1)/p;
y=fft(x);
yp=zeros(p,1);
yp(1:m/2)=y(1:m/2);
yp(m/2+1)=real(y(m/2+1));
if(m<n)
yp(p-m/2+1)=yp(m/2+1);
end
yp(p-m/2+2:p)=y(n-m/2+2:n);
xp=real(ifft(yp))*(p/n);
plot(t,x,'o',tp,xp)

% m = 4 sau m = 6
% dftfilter([0,1],[-2.2,-2.8,-6.1,-3.9,0.0,1.1,-0.6,-1.1],m,8,200)