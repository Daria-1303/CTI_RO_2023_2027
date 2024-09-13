function integrala = C_ad_Simpson(f, a, b, tol)

mijloc = (a + b) / 2;

S1 = Regula_lui_Simpson_compusa(f, a, b, 1);

S2 = Regula_lui_Simpson_compusa(f, a, mijloc, 1) + Regula_lui_Simpson_compusa(f, mijloc, b, 1);


if abs(S1 - S2) < 10 * tol
    integrala = S2;
else
    integrala = C_ad_Simpson(f, a, mijloc, tol / 2) + C_ad_Simpson(f, mijloc, b, tol / 2);
end