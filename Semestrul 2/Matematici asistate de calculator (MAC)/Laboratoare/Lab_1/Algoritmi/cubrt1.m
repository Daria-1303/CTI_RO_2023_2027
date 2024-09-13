y(1) = 1;

n = 15;

z=input('Enter z:');

for i = 1:n-1
    y(i+1) = 2*y(i)/3 + z/(3*y(i)^2);
end

y

plot(1:n,y)
title('Iterative method for cube roots')
xlabel('Iteration number')
ylabel('Approximate cube root')

% e=y-4;
% plot(1:n,e)