function derivata = Formula_diferente_doua_puncte(f, x, n)

for i = 1 : n
    h = 10 ^ (-i);
    
    derivata(i) = (f(x + h) - f(x)) / h;
end