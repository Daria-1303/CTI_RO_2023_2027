opts=odeset('RelTol',1e-6);

[t1, y1] = ode45(@Functia_a, [0 1], 1, opts);

[t2, y2] = ode45(@Functia_b, [0 1], 1, opts);

[t3, y3] = ode45(@Functia_c, [0 1], 1, opts);

a = [t1, y1]

b = [t2, y2]

c = [t3, y3]