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
plot(S(2,:))
hold on
plot(out.simout')
legend('1','2')
%%
close all
plot(S(2,:))
hold on
plot(out.simout')
legend('1','2')

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
t_sim = t_k(1:length(S(1,:)));
err_meas =  y(1,:)-S(1,:) ;
err_kalm = abs(out_KALMAN(1,:) - S(1,:));
plot(t_sim,err_meas);
hold on
p = plot(t_sim,err_kalm);
Lege=legend("i_L Error (measurement)" , "i_L Error (kalman)")
y_la = ylabel('i_L(A)','FontSize',24);
x_la = xlabel('time(second)','FontSize',24);
set(x_la, 'FontSize', 26)
set(y_la, 'FontSize', 26)
set(Lege, 'FontSize', 24)
ax = gca;
ax.FontSize = 20; 
p.LineWidth = 4;

%%
start = 1100
endd = Len;
t_sim = t_k(1:length(S(1,:)));
for k = 1:simTime/(5*100*T)+1
    R_(k) = 1/out_KALMAN(3,k);

end
p = plot(t_sim(start:endd), R_(start:endd))
Lege = legend("R");
ti = title('Estimated resistor Value of buck-boost converter')
y_la = ylabel('Resistor value(\Omega)','FontSize',24);
x_la = xlabel('time(second)','FontSize',24);
set(x_la, 'FontSize', 26)
set(y_la, 'FontSize', 26)
set(Lege, 'FontSize', 24)
set(ti, 'FontSize', 24)
ax = gca;
ax.FontSize = 20; 
p.LineWidth = 4;


%%
close all
p1 = plot(t_k(1:50001),buck_boost_e)
hold on
p2 = plot(t_k(1:50001),buck_boost_s , '--')
p1.LineWidth = 4;
p2.LineWidth = 4;

y = ylabel('i_L(A)');
x_lable = xlabel('time(second)');
set(x_lable, 'FontSize', 36)
set(y, 'FontSize', 36)

l= legend('modified equations' , 'MATLAB Simulink')
set(l, 'FontSize', 36)

%%

    k = S(2,:)-out.simout';
    plot(k)
%%
close all
plot(S(2,:))
hold on
plot(out.simout')
%%
close all
clc
buck_e_i = S(1,:);
buck_s_i = out.simout1;
buck_e_v = S(2,:);
buck_s_v = out.simout;
%%
close all
clc

boost_e_i = S(1,:);
boost_s_i = out.simout1;
boost_e_v = S(2,:);
boost_s_v = out.simout;
%%
close all
clc


buck_boost_e_i = S(1,:);
buck_boost_s_i = out.simout1;
buck_boost_e_v = S(2,:);
buck_boost_s_v = out.simout;
%RMSE_Vout = sqrt(mean((buck_boost_e - buck_boost_s).^2))
%%
close all
t_sim = t_k(1:length(buck_boost_e_i));
subplot(3,1,1);
p1=plot(t_sim,buck_e_i)

hold on
p2=plot(t_sim,buck_s_i , '--')
title('Buck converter duty cycle:0.5')
l= legend('modified equations' , 'MATLAB Simulink')
set(l, 'FontSize', 24)
y = ylabel('i_L(A)');
subplot(3,1,2);
p3=plot(t_sim,boost_e_i )
hold on
p4=plot(t_sim,boost_s_i, '--')
title('Boost converter duty cycle:0.5')
y = ylabel('i_L(A)');

subplot(3,1,3);
p5=plot(t_sim,buck_boost_e_i)
hold on
p6=plot(t_sim,buck_boost_s_i, '--')
title('Buck-Boost converter duty cycle:0.5')
y = ylabel('i_L(A)');
x_lable = xlabel('time(second)');

p1.LineWidth = 4;
p2.LineWidth = 4;
p3.LineWidth = 4;
p4.LineWidth = 4;
p5.LineWidth = 4;
p6.LineWidth = 4;
%%
close all

subplot(3,1,1);
p1=plot(t_sim,buck_e_v)

hold on
p2=plot(t_sim,buck_s_v , '--')
title('Buck converter duty cycle:0.5')
l= legend('modified equations' , 'MATLAB Simulink')
set(l, 'FontSize', 24)
y = ylabel('i_L(A)');
subplot(3,1,2);
p3=plot(t_sim,boost_e_v)
hold on
p4=plot(t_sim,boost_s_v, '--')
title('Boost converter duty cycle:0.5')
y = ylabel('i_L(A)');

subplot(3,1,3);
p5=plot(t_sim,buck_boost_e_v)
hold on
p6=plot(t_sim,buck_boost_s_v, '--')
title('Buck-Boost converter duty cycle:0.5')
y = ylabel('i_L(A)');
x_lable = xlabel('time(second)');

p1.LineWidth = 4;
p2.LineWidth = 4;
p3.LineWidth = 4;
p4.LineWidth = 4;
p5.LineWidth = 4;
p6.LineWidth = 4;
%%

clc
close all
t_sim = t_k(1:length(S(1,:)));
endd = 5000
p1 = plot(t_sim(1:endd) , y(1,1:endd) )
hold on
p2 = plot(t_sim(1:endd),out_KALMAN(1,1:endd) )
hold on
p3 = plot(t_sim(1:endd),S(1,1:endd), '--')

ti = title('Inductor current of buck-boost converter')
leg = legend('i_L measurement' , 'i_L estimate' , 'i_L')
set(leg, 'FontSize', 24)
x_lable = ylabel('i_L(A)');
y_lable = xlabel('time(second)');
set(x_lable, 'FontSize', 26)
set(y_lable, 'FontSize', 26)
set(ti, 'FontSize', 24)

ax = gca;
ax.FontSize = 20; 

p1.LineWidth = 4;
p2.LineWidth = 2;
p3.LineWidth = 2;



%%
clc
close all

t_sim = t_k(1:length(S(1,:)));
endd = 5000
p1 = plot(t_sim(1:endd) , y(2,1:endd) )
hold on
p2 = plot(t_sim(1:endd),out_KALMAN(2,1:endd) )
hold on
p3 = plot(t_sim(1:endd),S(2,1:endd), '--')

ti = title('Capacitor voltage of buck-boost converter')
leg = legend('v_C measurement' , 'v_C estimate' , 'v_C')
x_lable = xlabel('time(second)');
y_lable = ylabel('v_C(v))');
set(x_lable, 'FontSize', 26)
set(y_lable, 'FontSize', 26)
set(leg, 'FontSize', 24)
set(ti, 'FontSize', 24)

ax = gca;
ax.FontSize = 20; 

p1.LineWidth = 4;
p2.LineWidth = 2;
p3.LineWidth = 2;


%%
start = 1100
endd = Len;
t_sim = t_k(1:length(S(1,:)));
for k = 1:simTime/(5*100*T)+1
    R_(k) = 1/out_KALMAN(3,k);

end
p = plot(t_sim(start:endd), R_(start:endd))
Lege = legend("R");
ti = title('Estimated resistor Value of buck-boost converter')
y_la = ylabel('Resistor value(\Omega)','FontSize',24);
x_la = xlabel('time(second)','FontSize',24);
set(x_la, 'FontSize', 26)
set(y_la, 'FontSize', 26)
set(Lege, 'FontSize', 24)
set(ti, 'FontSize', 24)
ax = gca;
ax.FontSize = 20; 
p.LineWidth = 4;