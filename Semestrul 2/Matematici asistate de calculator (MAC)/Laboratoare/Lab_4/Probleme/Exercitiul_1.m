% Datele punctelor
x = [-2, 0, 1, 3];
y = [8, 4, 2, -2];

% Calculează coeficienții diferențelor divizate
c = newtondd(x, y, length(x))



% Punctele de interpolare
 %z = linspace(min(x), max(x), 100);
z = -5:0.01:10;

% Calculează valorile interpolate folosind nested
y_interpolate = nested(3, c, z, x);

% Plotează punctele și polinomul interpolant
plot(x, y, 'o', z, y_interpolate);

%pana aici 

title('Interpolare folosind Newton cu diferențe divizate');
xlabel('x');
ylabel('y');
legend('Puncte de interpolare', 'Polinomul interpolant');