%%
close all
plot(S(1,:))
figure
plot(S(2,:))

%%
close all
plot(y(1,:))
figure
plot(y(2,:))

%%
close all
plot(x_kalman(1,:))
figure
plot(x_kalman(2,:))

%%
close all

plot(out_KALMAN(1,:))
figure
plot(out_KALMAN(2,:))
%%
err_meas =  y(2,:)-S(2,:) ;
err_kalm = out_KALMAN(2,:) - S(2,:);
plot(err_meas);
hold on
plot(err_kalm);
legend("Vout Error (measurement)" , "Vout Error (kalman)")

%%
err_meas =  y(1,:)-S(1,:) ;
err_kalm = out_KALMAN(1,:) - S(1,:);
plot(err_meas);
hold on
plot(err_kalm);
legend("Iout Error (measurement)" , "Iout Error (kalman)")

%%
for k = 1:simTime/(100*T)+1
    R_(k) = 1/out_KALMAN(3,k);

end
plot(R_)
    legend("R");
