clc
dt = linspace(0,1,25);
d = 0.5;
R = 5 ;
C = 1e-5;
L = 1e-3 ;
f = 10e3 ;
T = 1/f ;
w = 2*pi/T ;
Vin = 20 ;
A = [0 -1/L 0 0 0 0;
     1/C -1/(R*C) 0 0 0 0;
      0 0 0 w -1/L 0;
      0 0 -w 0 0 -1/L;
      0 0 1/C 0 -1/(R*C) w;
      0 0 0 1/C -w -1/(R*C)];
  
B = [d/L 0 sin(2*pi*d)/(2*pi*L) (1-cos(2*pi*d))/(-2*pi*L) 0 0]';
    
    