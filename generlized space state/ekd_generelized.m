clear 
clc
% simulation parameter
T = 0.01;
simTime = 10;
t = 0:T:simTime;
% model parameter
x_k0 = [20;0]*pi/180;
x = x_k0;
m = 0.1; %(kg)
l = 0.3; %(m)
g = 9.81; %(m/s^2)
K = 0.1;
v_sd = 0.01*pi/180;
n_sd = 0.2*pi/180;
f = @(x,n) [ x(1)+T*x(2)+n(1);...
           -T*g/l*sin(x(1))+(1-T*K/m)*x(2)+n(2)];
h = @(x,v) [1 0]*x+v;
% EKF parameter
Jf = @(x) [  1                T       ;...
           -T*g/l*cos(x(1)) (1-T*K/m)];
Jh = @(x) [1 0];
Rv = diag([v_sd^2 v_sd^2]);
Rn = n_sd^2;
x_h_k0_EKF = [20;0]*pi/180;
P_k0_EKF = 0.001*eye(2);
MSE_EKF = 0;
% UKF parameter
L = 2;
alpha = 0.1; % 1e-4:1
kappa = 0; % 0 or 3-L
beta = 2;
lambda = alpha^2*(L+kappa)-L;
gamma = sqrt(L+lambda);
Mat1 = ones(L,1);
wm = [lambda/(L+lambda)  0.5/(L+lambda)*ones(1,2*L)];
wc = [lambda/(L+lambda)+1-alpha^2+beta^2  0.5/(L+lambda)*ones(1,2*L)];
Rv = diag([v_sd^2 v_sd^2]);
Rn = n_sd^2;
x_h_k0_UKF = [20;0]*pi/180;
P_k0_UKF = 0.001*eye(2);
MSE_UKF = 0;
x_1 = x_k0;
p_1 = P_k0_EKF ;
% sim loop
for k = 2:simTime/T+1
    % plant
    x_k = f(x_k0,v_sd*randn(2));
    x(:,k) = x_k;
    x_k0 = x_k;
    y_k = h(x_k,n_sd*randn);
    y_rea = h(x_k,0);
    y(k) = y_k;
    S(k) = y_rea;
    x_ = f(x_1 , [0 0;0 0]) ;
    p_ = Jf(x_1)*p_1*Jf(x_1)' + Rv ;
    K = p_*Jh(0)'*inv(Jh(0)*p_*Jh(0)' + Rn) ;
    x_1 = x_ + K*(y_k - h(x_ , 0)) ;
    y_kalman(k) = x_1(1) ;
    p_1 = (eye(2) - K*Jh(0))*p_;
end
    
    