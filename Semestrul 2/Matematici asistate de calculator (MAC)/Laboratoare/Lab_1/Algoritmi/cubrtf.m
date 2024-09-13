function y = cubrtf(x)
y=1;
n=15;
for i = 1:n
y = 2*y/3 + x/(3*y^2);
end
