function w = eulerstep(t, w, h)

w = w + h * ydot(t, w);