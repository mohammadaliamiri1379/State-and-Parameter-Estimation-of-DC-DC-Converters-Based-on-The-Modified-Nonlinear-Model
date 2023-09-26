clc
QWE = length(1:simTime/(50*T)+1);
for k = 1:simTime/(50*T)+1
    % plant
    
    x_k = f(x_k0,v_sd*[randn;randn;randn;randn;randn;randn;0] ,duty_cycle);
    x(:,k) = x_k;
    x_k0 = x_k;
    y_k = h(x_k , t_k(k) , n_sd*[randn;randn]);
    y_rea = h(x_k , t_k(k) , [0;0]);
    y(:,k) = y_k;
    S(:,k) = y_rea;
    %y_k = y_k;
% % 
    x_ = f(x_1 , [0;0;0;0;0;0;0] , duty_cycle) ;
    p_ = Jf(x_1)*p_1*Jf(x_1)' + Rv ;
    Jh_e = Jh(t_k(k));
    K = p_*Jh_e'*inv(Jh_e*p_*Jh_e' + Rn2) ;
    y_k_es =  h(x_ ,t_k(k), [0;0]);
    x_1 = x_ + K*(y_k -y_k_es) ;
    x_kalman(:,k) = x_1;
    out_KALMAN(:,k) = h(x_1,t_k(k),[0;0]) ;
    p_1 = (eye(n) - K*Jh(t_k(k)))*p_;
    k/QWE*100
end
% Root Mean Squared Error
% RMSE_Vout = sqrt(mean((S(1,:) - out_KALMAN(1,:)).^2));  
% RMSE_IL = sqrt(mean((S(2,:) - out_KALMAN(2,:)).^2));  

