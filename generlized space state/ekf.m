clc

for k = 1:simTime/(50*T)+1
    % plant
    
    x_k = f(x_k0,v_sd*[randn;randn;randn;randn;randn;randn] ,duty_cycle);
    x(:,k) = x_k;
    x_k0 = x_k;
    y_k = h(x_k , t_k(k) , n_sd*[randn;randn]);
    y_rea = h(x_k , t_k(k) , [0;0]);
    y(:,k) = y_k;
    S(:,k) = y_rea;
    y_k = y_k(1);
% 
    x_ = f(x_1 , [0;0;0;0;0;0] , duty_cycle) ;
    p_ = Jf(x_1)*p_1*Jf(x_1)' + Rv ;
    K = p_*Jh2(t_k(k))'*inv(Jh2(t_k(k))*p_*Jh2(t_k(k))' + Rn2) ;
    x_1 = x_ + K*(y_k - h2(x_ ,t_k(k), [0])) ;
    x_kalman(:,k) = x_1;
    out_KALMAN(:,k) = h(x_1,t_k(k),[0;0]) ;
    p_1 = (eye(n) - K*Jh2(t_k(k)))*p_;
    
end
% Root Mean Squared Error
RMSE_Vout = sqrt(mean((S(1,:) - out_KALMAN(1,:)).^2));  
RMSE_IL = sqrt(mean((S(2,:) - out_KALMAN(2,:)).^2));  

