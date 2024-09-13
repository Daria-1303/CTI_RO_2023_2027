format long;

[t, w] = Problema_4a([0,1], 1, 10);

yy = @(t) (t* 3 + 1) .^ ( 1 / 3);

int = 0 : 0.1 : 1;

eroare = [yy(int) - w];

raspuns_a = [t; w; eroare]'

[t, w] = Problema_4a([0,1], 1, 20);

yy = @(t) (t* 3 + 1) .^ ( 1 / 3);

int = 0 : 0.05 : 1;

eroare = [yy(int) - w];

raspuns_a = [t; w; eroare]'

[t, w] = Problema_4a([0,1], 1, 40);

yy = @(t) (t* 3 + 1) .^ ( 1 / 3);

int = 0 : 0.025 : 1;

eroare = [yy(int) - w];

raspuns_a = [t; w; eroare]'




[t, w] = Problema_4b([0,1], 1, 10);

yy = @(t) exp(t.^2 + 2*t);

int  = 0 : 0.1 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'

[t, w] = Problema_4b([0,1], 1, 20);

yy = @(t) exp(t.^2 + 2*t);

int  = 0 : 0.05 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'

[t, w] = Problema_4b([0,1], 1, 40);

yy = @(t) exp(t.^2 + 2*t);

int  = 0 : 0.025 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'




[t, w] = Problema_4c([0,1], 1, 10);

yy = @(t) (3/4 * t.^4 + 1).^(1/3);

int = 0 : 0.1 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'


[t, w] = Problema_4c([0,1], 1, 20);

yy = @(t) (3/4 * t.^4 + 1).^(1/3);

int = 0 : 0.05 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'


[t, w] = Problema_4c([0,1], 1, 40);

yy = @(t) (3/4 * t.^4 + 1).^(1/3);

int = 0 : 0.025 : 1;

eroare = [yy(int) - w];

[t; w; eroare]'