function z = ydot(t, w)

%rulati pt functia 1

% z = 1 / (w ^ 2);

% rulati apoi urmatoarele comenzi pt eroare

% yy = @(t) (t* 3 + 1) .^ ( 1 / 3);
% int = 0 : 0.1 : 1;
% eroare = [yy(int) - w];
% [t; w; eroare]'
% 
% [t, w] = Metoda_Euler1([0,1], 1, 10)

% pt functia 2

% z = 2 * (t + 1) * w;

% yy = @(t) exp(t.^2 + 2*t);
% int  = 0 : 0.1 : 1;
% eroare = [yy(int) - w];
% [t; w; eroare]'

% pt functia 3

z = (t ^ 3) / (w ^ 2);

% yy = @(t) (3/4 * t.^4 + 1).^(1/3);
% int = 0 : 0.1 : 1;
% eroare = [yy(int) - w];
% [t; w; eroare]'