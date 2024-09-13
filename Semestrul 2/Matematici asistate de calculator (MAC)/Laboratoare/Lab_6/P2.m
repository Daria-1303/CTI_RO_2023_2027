format long;

syms y;

fsym = y.^(-1);

derivata_simbolica = matlabFunction(diff(fsym));

f = @(x) (x.^(-1));

eroare = [Formula_diferente_doua_puncte(f, 1, 12) - derivata_simbolica(1)]