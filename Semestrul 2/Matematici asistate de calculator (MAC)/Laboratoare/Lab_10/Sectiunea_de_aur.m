function xmin = Sectiunea_de_aur(f, a, b, k)

% k -> nr de pasi

g = (sqrt(5) - 1) / 2;

% calculam x1, x2 pt simplificarea algoritmului
x1 = a + (1 - g) * (b - a);
x2 = a + g * (b - a);

%la fel si pt functiile pe care trb sa le testam
f1 = f(x1);
f2 = f(x2);

for i = 1 : k
    if f1 < f2
        b = x2;
        x2 = x1;
        x1 = a + (1 - g) * (b - a);
        f2 = f1;
        f1 = f(x1);
    else
        a = x1;
        x1 = x2;
        x2 = a + g * (b - a);
        f1 = f2;
        f2 = f(x2);
    end
end

xmin = (a + b) / 2;

% f=@(x) x^6-11*x^3+17*x^2-7*x+1;
% xmin=Sectiunea_de_aur(f,0,1,10)