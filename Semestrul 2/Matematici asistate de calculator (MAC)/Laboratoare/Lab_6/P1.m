format long

%folosim derivarea numerica (aproximativa)
syms y;

fsym = sin(y) - cos(y);

derivata_simbolica = matlabFunction(diff(fsym));

f = @(x) ( sin(x) - cos(x));

eroare = [Formula_diferente_doua_puncte(f, 0, 12) - derivata_simbolica(0)]