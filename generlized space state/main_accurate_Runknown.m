clc
clear all
% simulation parameter
T = 1e-6;
simTime = 5;
t_k = 0:T:simTime;
% model parameter
%dt = linspace(0,1,25);
%d = dt;
n = 3 ; % order of system
duty_cycle = 0.5 ;
R = 5 ;
C = 1e-5;
L = 1e-3 ;
fre = 10e3 ;
Ts = 1/fre ;
Vin = 20 ;    
f = @(x, n ,d , t) [T/L*(Vin*fun(Ts,d,t)-x(2))+fun_L(x(1))+n(1);...
                    T/C*(fun_L(x(1))-x(2)*x(3))+x(2)+n(2);...
                    x(3)+n(3)] ;
                
h = @(x,v) x+[v(1);v(2);v(2)];
h2 = @(x,v) [0 1 0]*x+v(1);
Jf = @(x) [dfun_L(x(1)) -T/L 0;...
            dfun_L(x(1))*T/C -T*x(3)/(C)+1 -T*x(2)/(C);...
            0 0 1] ;
Jh = @(x) [1 0 0;...
            0 1 0;...
            0 0 1];

Jh2= @(x) [0 1 0];
v_sd=0.001;
n_sd=1;
Rv = diag([v_sd^2 v_sd^2 0]);
Rn = diag([n_sd^2 n_sd^2 0]);
Rn2 = n_sd^2;

x_system = [0;0;1/R];

x_h_k0_EKF = [0;0;0];
P_k0_EKF = 0.1*eye(n);
x_1 = x_h_k0_EKF ;
x_k0 = x_h_k0_EKF;
p_1 = P_k0_EKF ;