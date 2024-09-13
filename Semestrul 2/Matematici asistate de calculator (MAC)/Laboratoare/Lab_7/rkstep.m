function w = rkstep(t, w, h)

s1 = ydot(t, w);

s2 = ydot(t + h/2, w + h/2 * s1);

s3 = ydot(t + h/2, w + h/2 * s2);

s4 = ydot(t + h, w + h * s3);

s = s1 + 2 * s2 + 2 * s3 + s4;

w = w + h / 6 * s;