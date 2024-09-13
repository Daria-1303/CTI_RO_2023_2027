function x = newton(F, DF, x0, k)

x = x0;

for i  = 1 : k
    x = x - inv(DF(x)) * F(x);
end

% 
% F = @(x) [x(1) - x(2)^3; x(1)^2 + x(2)^2 - 1];
% DF = @(x) [1, -3*x(2)^2; 2*x(1), 2*x(2)];
% x = newton(F, DF, [1;2], 10)