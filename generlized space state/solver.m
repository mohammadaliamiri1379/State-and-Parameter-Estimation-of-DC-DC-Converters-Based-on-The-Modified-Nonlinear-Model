clc
y0 = [0 0 0 0 0 0];
tspan = [0 5];

opts = odeset('RelTol',1e-2,'AbsTol',1e-4);
[t,y] = ode45(@(t,y) odefun(t,y,L,d,R,Vin,w,C), tspan, y0);
IL = y(:,1)+2*y(:,3).*cos(w*t)-2*y(:,4).*sin(w*t) ;
Vout = y(:,2)+2*y(:,5).*cos(w*t)-2*y(:,6).*sin(w*t) ;
plot(IL) ;
%Vout_sim = out.V;
%figure 
%plot(Vout_sim)

