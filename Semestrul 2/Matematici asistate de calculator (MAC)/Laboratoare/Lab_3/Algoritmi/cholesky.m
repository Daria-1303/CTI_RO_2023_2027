function R = cholesky(A)
    n = size(A, 1); 

    % n = nr_linii

    U = zeros(n);

    for k = 1 : n
        if A(k, k) <= 0
            error('Matricea nu este pozitiv definită.');
        end

        R(k, k) = sqrt(A(k, k));

        U = (1/ R(k, k)) * A(k, k+1:n);

        R(k, k+1:n) = U;   

        A(k+1 : n, k+1 : n) = A(k+1 : n, k+1 : n) - U' * U;
end
