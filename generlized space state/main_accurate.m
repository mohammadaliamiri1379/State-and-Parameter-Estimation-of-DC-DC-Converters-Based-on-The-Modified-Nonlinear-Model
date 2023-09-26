clc
clear all
% simulation parameter
T = 1e-6;
simTime = 5;
t_k = 0:T:simTime;
% model parameter
%dt = linspace(0,1,25);
%d = dt;
n = 2 ; % order of system
duty_cycle = 0.5 ;
R = 5 ;
C = 1e-5;
L = 1e-3 ;
fre = 10e3 ;
Ts = 1/fre ;
Vin = 20 ;
f = @(x, n ,d , t) [T/L*(Vin*fun(Ts,d,t)-x(2))+fun_L(x(1))+n(1);...
                    T/C*(fun_L(x(1))-x(2)/R)+x(2)+n(2)] ;
h = @(x,v) x+[v(1);v(2)];
h2 = @(x,v) [0 1]*x+v(1);
Jf = @(x) [dfun_L(x(1)) -T/L;...
            dfun_L(x(1))*T/C -T/(R*C)+1] ;
Jh = @(x) [1 0;...
            0 1];

Jh2= @(x) 1;
v_sd=0.001;
n_sd=0.5;
Rv = diag([v_sd^2 v_sd^2]);
Rn = diag([n_sd^2 n_sd^2]);
Rn2 = n_sd^2;

x_h_k0_EKF = [0;0];
P_k0_EKF = 0.1*eye(n);
x_1 = x_h_k0_EKF ;
x_k0 = x_h_k0_EKF;
p_1 = P_k0_EKF ;