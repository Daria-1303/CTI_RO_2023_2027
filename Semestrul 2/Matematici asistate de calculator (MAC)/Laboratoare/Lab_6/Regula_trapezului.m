function integrala = Regula_trapezului(f, x0, x1)

y0 = f(x0);

y1 = f(x1);

% pasul -> h

h = x1 - x0;

integrala = (h / 2) * (y0 + y1);

% integrala = Regula_trapezului(@log, 1, 2)

% valoare reala -> putem calcula ulterior eroarea
% int = integral(@log, 1, 2)