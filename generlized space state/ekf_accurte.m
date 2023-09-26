clc
QSW = length(1:simTime/(100*T)+1) ;
for k = 1:simTime/(100*T)+1
    % plant
    
    x_k = f(x_k0,v_sd*[randn;randn] ,duty_cycle,t_k(k));
    x(:,k) = x_k;
    x_k0 = x_k;
    y_k = h(x_k , n_sd*[randn;randn]);
    y_rea = h(x_k , [0;0]);
    y(:,k) = y_k;
    S(:,k) = y_rea;
    
     x_ = f(x_1 , [0;0] , duty_cycle,t_k(k)) ;
    p_ = Jf(x_1)*p_1*Jf(x_1)' + Rv ;
    K = p_*Jh(t_k(k))'*inv(Jh(t_k(k))*p_*Jh(t_k(k))' + Rn) ;
    x_1 = x_ + K*(y_k - h(x_ , [0;0]) ) ;
    x_kalman(:,k) = x_1;
    out_KALMAN(:,k) = h(x_1,[0;0]) ;
    p_1 = (eye(n) - K*Jh(t_k(k)))*p_;
%     
k/QSW*100 
end
% Root Mean Squared Error
RMSE_Vout = sqrt(mean((S(1,:) - out_KALMAN(1,:)).^2));  
RMSE_IL = sqrt(mean((S(2,:) - out_KALMAN(2,:)).^2));  
