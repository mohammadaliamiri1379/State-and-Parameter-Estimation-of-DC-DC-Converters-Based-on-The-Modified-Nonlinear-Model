clc
clear all
% simulation parameter
T = 1e-6;
simTime = 5;
t_k = 0:T:simTime;
% model parameter
%dt = linspace(0,1,25);
%d = dt;
n = 6 ; % order of system
duty_cycle = 0.5 ;
R = 5 ;
C = 1e-5;
L = 1e-3 ;
f = 10e3 ;
T_switching = 1/f ;
w = 2*pi/T_switching ;
Vin = 20 ;
f = @(x, n ,d) [-1/L*x(2)*T+d*Vin/L*T+n(1)+x(1);...
            1/C*x(1)*T-1/(R*C)*x(2)*T+x(2)+n(2);...
            w*x(4)*T-1/L*x(5)*T+Vin*sin(2*pi*d)/(2*pi*L)*T+x(3)+n(3);...
            -w*x(3)*T-1/L*x(6)*T-Vin*(1-cos(2*pi*d))/(2*pi*L)*T+x(4)+n(4);...
            1/C*x(3)*T-1/(R*C)*x(5)*T+w*x(6)*T+ x(5)+n(5);...
            1/C*x(4)*T-w*x(5)*T-1/(R*C)*x(6)*T+x(6)+n(6)] ;
h = @(x,t,v) [0 1 0 0 2*cos(w*t) -2*sin(w*t);...
              1 0 2*cos(w*t) -2*sin(w*t) 0 0]*x+[v(1);v(2)];
 
h2 = @(x,t,v) [0 1 0 0 2*cos(w*t) -2*sin(w*t)]*x + v;
% EKF parameter
Jf = @(x) [1 -1/L*T 0 0 0 0;...
           1/C*T -T/(R*C)+1 0 0 0 0;...
           0 0 1 w*T -1/L*T 0;...
           0 0 -w*T 1 0 -1/L*T;...
           0 0 1/C*T 0 T/(R*C)+1 w*T;...
           0 0 0 1/C*T -w*T -T/(R*C)+1] ;
       
Jh = @(t) [0 1 0 0 2*cos(w*t) -2*sin(w*t);
            1 0 2*cos(w*t) -2*sin(w*t) 0 0];
        
Jh2= @(t) [0 1 0 0 2*cos(w*t) -2*sin(w*t)];

v_sd = 0.001;
n_sd = 0.1;

Rv = diag([v_sd^2 v_sd^2 v_sd^2 v_sd^2 v_sd^2 v_sd^2]);
Rn = diag([n_sd^2 n_sd^2]);

Rn2 = n_sd^2;
x_h_k0_EKF = [0;0;0;0;0;0];
P_k0_EKF = 0.1*eye(n);
x_1 = x_h_k0_EKF ;
x_k0 = x_h_k0_EKF;
p_1 = P_k0_EKF ;