opts=odeset('RelTol',1e-4,'Refine',1,'MaxStep',1);

[t,y]=ode45(@(t,y) t*y+t^3,[0 1],1,opts)

opts=odeset('RelTol',1e-6);

ode45(@(t,y) t*y+t^3,[0 1],1,opts)