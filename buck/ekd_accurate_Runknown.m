clc
QSW = length(1:simTime/(5*100*T)+1) ;
for k = 1:simTime/(5*100*T)+1
    % plant
  
    x_k = f(x_system,[v_sd*randn;v_sd*randn;1e-5*randn] ,duty_cycle,t_k(k));
    x(:,k) = x_k;
    x_system = x_k;
    y_k = h(x_k , n_sd*[randn;randn;0]);
    y_rea = h(x_k , [0;0;0]);
    y(:,k) = y_k;
    S(:,k) = y_rea;
    y_k = y_k(2);
    %y_k = out.simout(k) +n_sd*randn ;
     x_ = f(x_1 , [0;0;0] , duty_cycle,t_k(k)) ;
    p_ = Jf(x_1,duty_cycle,t_k(k))*p_1*Jf(x_1,duty_cycle,t_k(k))' + Rv ;
    K = p_*Jh2(t_k(k))'*inv(Jh2(t_k(k))*p_*Jh2(t_k(k))' + Rn2) ;
    x_1 = x_ + K*(y_k - h2(x_ , 0) ) ;
    x_kalman(:,k) = x_1;
    out_KALMAN(:,k) = h(x_1,[0;0;0]) ;
    p_1 = (eye(n) - K*Jh2(t_k(k)))*p_;
% %     
k/QSW*100 
end


%%
Len = length(S(1,:))
sum = 0;
o = 0 ;
for k = 1:Len
    sum = sum + (S(1,k) - out_KALMAN(1,k))^2;
    o = o + S(1,k);
end
NRMSED_IL = sqrt(sum/Len)/(o/Len)*100

sum = 0;
o = 0 ;
for k = 1:Len
    sum = sum + (S(2,k) -out_KALMAN(2,k))^2;
    o = o + S(2,k);
end
NRMSED_Vout = sqrt(sum/Len)/(o/Len)*100


sum = 0;
o = 0 ;
for k = 1:Len
    sum = sum + (1/R -out_KALMAN(3,k))^2;
    o = o + 1/R;
end
NRMSED_g = sqrt(sum/Len)/(o/Len)*100
finall_g = out_KALMAN(3 , Len);
finall_R = 1/finall_g
E_R = abs(finall_R - R)/R*100
E_R = abs(finall_R - R)/R*100
1/mean(out_KALMAN(3,Len-100:Len))

%%
Len = length(S(1,:))
sum = 0;
o = 0 ;
for k = 1:Len
    sum = sum + (out.simout1(k) - S(1,k))^2;
    o = o + out.simout1(k);
end
NRMSD_IL = sqrt(sum/Len)/(o/Len)

sum = 0;
o = 0 ;
for k = 1:Len
    sum = sum + (out.simout(k) -S(2,k))^2;
    o = o + out.simout(k);
end
NRMSD_Vout = sqrt(sum/Len)/(o/Len)
