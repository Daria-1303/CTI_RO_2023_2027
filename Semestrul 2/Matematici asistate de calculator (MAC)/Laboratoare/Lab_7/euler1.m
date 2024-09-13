function [t,y]=euler1(inter,y0,n)
t(1)=inter(1);
y(1)=y0;
h=(inter(2)-inter(1))/n;
for i=1:n
t(i+1)=t(i)+h;
y(i+1)=eulerstep(t(i),y(i),h);
end
plot(t,y)