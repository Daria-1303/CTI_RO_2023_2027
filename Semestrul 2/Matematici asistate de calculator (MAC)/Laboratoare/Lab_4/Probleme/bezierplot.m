function bezierplot(x,y)

hold on;

t = 0:0.02:1;

plot([x(1) x(2)], [y(1) y(2)],'r:', x(2),y(2),'rs');

plot([x(3) x(4)], [y(3) y(4)],'r:', x(3),y(3),'rs');

plot(x(1), y(1),'bo', x(4), y(4),'bo');

coeff = beziercoeff(x,y);

xp = coeff(1,1) + t.*(coeff(1,2) + t.* (coeff(1,3) + t * coeff(1,4)));

yp = coeff(2,1) + t.*(coeff(2,2) + t.*(coeff(2,3) + t * coeff(2,4)));

plot(xp,yp)

hold off;

% >‌> x=[1;1;3;2];
% >‌> y=[1;3;3;2];
% >‌> coeff=beziercoeff(x,y)
% Aceeaşi curbă poate fi desenată folosind funcţia de mai sus, astfel:
 % x=[1;1;3;2];
 % y=[1;3;3;2];
 % bezierplot(x,y)