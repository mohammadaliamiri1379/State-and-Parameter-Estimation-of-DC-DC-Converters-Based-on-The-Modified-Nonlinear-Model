function dydt = odefun(t,y,L,d,R,Vin,w,C)
%d = interp1(dt,d,t);
dydt = zeros(6,1);
dydt(1) = -1/L*y(2) + d*Vin/L;
dydt(2) = 1/C*y(1)-1/(R*C)*y(2);
dydt(3) = w*y(4)-1/L*y(5)+ Vin*sin(2*pi*d)/(2*pi*L);
dydt(4) = -w*y(3)-1/L*y(6)- Vin*(1 - cos(2*pi*d))/(2*pi*L) ;
dydt(5) = 1/C*y(3) -1/(R*C)*y(5) +w*y(6);
dydt(6) = 1/C*y(4)-w*y(5)-1/(R*C)*y(6);
end
