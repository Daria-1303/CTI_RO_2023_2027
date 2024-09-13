function w = trapezstep(t, w , h)

w = w + (h / 2) * ( ydot(t, w) + ydot(t + h, w + h * ydot(t, w)));