function xc = metoda_bisectiei(f, a, b, TOL)

if f(a) * f(b) >= 0
    error('Nu este respectata conditia')
end

while (b - a) / 2 > TOL
    c = (a + b) / 2;
    if f(c) == 0
        break;
    end
    
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
        
    end
end
xc = (a + b) / 2; 

% ex Laborator 2
% f=@(x) x^3+x-1;
% xc = metoda_bisectiei(f, 0, 1, 0.00005) 
% 0.6823

