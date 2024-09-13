function xmin = Interpolarea_parabolica_succesiva(f, r, s, t, k)

% r, s, t sunt variabile care se iau in jurul minimului daca nu sunt date
% in enunt

x(1) = r;
x(2) = s;
x(3) = t;

fr = f(r);
fs = f(s);
ft = f(t);

for i = 4 : k + 3
    x(i) = (r + s) / 2 - (fs - fr) * (t - r) * (t - s) / (2 * ((s - r) * (ft - fs) - (fs - fr) * (t - s) ) );
    t = s;
    s = r;
    r = x(i);
    ft = fs;
    fs = fr;
    fr = f(r);
end

xmin = x(k + 3);

% f=@(x) x^6-11*x^3+17*x^2-7*x+1;
% xmin=Interpolarea_parabolica_succesiva(f,0,0.7,1,10)

% Minimul unei functii poate fi gasit utilizand functia fminbnd(f, a, b)
% f=@(x) x^6-11*x^3+17*x^2-7*x+1;
% xmin=fminbnd(f,0,1)

% sau putem utiliza pentru functii de doua sau mai multe variabile functia fminsearch:
% f=@(x) 5*x(1)^4+4*x(1)^2*x(2)-x(1)*x(2)^3+4*x(2)^4-x(1);
% xmin=fminsearch(f,[1;1])

% pt reprezentare:
% f=@(x,y) 5*x^4+4*x^2*y-x*y^3+4*y^4-x;
% ezmesh(f, [-1 1])
% ezsurf(f, [-1 1])