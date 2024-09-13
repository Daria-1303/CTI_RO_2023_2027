function x =punct_fix(f, x0, numar_pasi)
    % f - function handle pentru funcția dată
    % x0 - valoarea inițială
    % numar_pasi - numărul de pași
    
    x(1)=x0;
    
    % Iterăm pentru numărul specificat de pași
    for i = 1:numar_pasi
        x(i+1)=f(x(i));
    end

    xc=x(numar_pasi+1);