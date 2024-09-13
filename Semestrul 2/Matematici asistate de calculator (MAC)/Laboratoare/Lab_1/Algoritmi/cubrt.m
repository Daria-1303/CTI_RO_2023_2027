% functia calculeaza radicalul de ordinul 3
y = 1; 

n = 15;

z = input('Introdu z: ');

for i = 1 : n
    y = 2 * y / 3 + z / (3 * y ^ 2);
end
y

% apelati : 
% cubrt
% dati input: de ex 8 va returna 2