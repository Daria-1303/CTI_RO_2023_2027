format long;

syms y;

fsym = (1 + y).^(-1);

derivata_simbolica = matlabFunction(diff(fsym));

f = @(x) (1 + x).^(-1);

eroare = [Formula_diferente_trei_puncte(f, 1, 12) - derivata_simbolica(1)]