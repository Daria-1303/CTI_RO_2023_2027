function y = eulerstep(t, y,h)
y=y+h*ydot(t,y);