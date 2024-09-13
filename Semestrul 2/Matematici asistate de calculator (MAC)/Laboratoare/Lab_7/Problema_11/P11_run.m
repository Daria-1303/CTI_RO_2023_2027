format long;

[t, w] = Problema_11a([0,1], 1, 20, 3);

yy = @(t) (t* 3 + 1) .^ ( 1 / 3);

int = 0 : 0.05 : 1;

eroare = [yy(int) - w'];

raspuns_a = [t', w, eroare']



[t, w] = Problema_11b([0,1], 1, 20, 3);

yy = @(t) exp(t.^2 + 2*t);

int  = 0 : 0.05 : 1;

eroare = [yy(int) - w'];

raspuns_b = [t', w, eroare']



[t, w] = Problema_11c([0,1], 1, 20, 3);

yy = @(t) (3/4 * t.^4 + 1).^(1/3);

int = 0 : 0.05 : 1;

eroare = [yy(int) - w'];

raspuns_c = [t', w, eroare']