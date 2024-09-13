function xc = mfp(f, a, b, k)

if f(a) * f(b) >= 0
    error('Nu este satisfacuta conditia f(a) * f(b) < 0')
end

for i = 1 : k
    c = (b * f(a) - a * f(b)) / (f(a) - f(b));

    if(f(c) == 0)
        break;
    end

    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

xc  = (b * f(a) - a * f(b)) / (f(a) - f(b));