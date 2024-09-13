function derivata = Formula_diferente_trei_puncte(f, x, n)

for i = 1 : n
    h = 10 ^ (-i);

    derivata(i) = (f(x + h) - f(x - h)) / (2 * h);
end