function integrala = C_adaptiva_noua(f, a, b, tol)

mijloc = (a + b) / 2;

S1 = (f(a) + f(b)) * (b - a) / 2;

S2 = (f(a) + f(mijloc)) * (mijloc - a) / 2 + (f(mijloc) + f(b)) * (b - mijloc) / 2;

if abs(S1 - S2) < 3 * tol
    integrala = S2;
else
    integrala = C_adaptiva_noua(f, a, mijloc, tol / 2) + C_adaptiva_noua(f, mijloc, b, tol / 2);
end