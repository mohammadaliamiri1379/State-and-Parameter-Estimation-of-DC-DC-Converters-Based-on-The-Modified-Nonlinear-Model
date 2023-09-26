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

%%
%%
close all
p1 = plot(t_k(1:50001),S(1,:))
hold on
p2 = plot(t_k(1:50001),out.simout1 , '--')
p1.LineWidth = 4;
p2.LineWidth = 4;

y = ylabel('i_L(A)');
x = xlabel('time(second)');
set(x, 'FontSize', 20)
set(y, 'FontSize', 20)

l= legend('modified equations' , 'MATLAB Simulink')
set(l, 'FontSize', 20)

%%

    k = S(1,:)-out.simout1';
    plot(k)

%%
