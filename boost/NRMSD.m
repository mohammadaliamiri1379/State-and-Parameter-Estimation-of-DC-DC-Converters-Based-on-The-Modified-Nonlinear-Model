




%%
clc
L = length(buck_e_i)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (buck_e_i(k) - buck_s_i(k))^2;
    o = o + buck_s_i(k);
end
NRMSE_buck_i = sqrt(sum/L)/(o/L) 
%%
clc
L = length(buck_e_v)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (buck_e_v(k) - buck_s_v(k))^2;
    o = o + buck_s_i(k);
end
NRMSE_buck_v = sqrt(sum/L)/(o/L) 
%%
L = length(buck_e_i)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (boost_e_i(k) - boost_s_i(k))^2;
    o = o + boost_s_i(k);
end
NRMSE_boost_i = sqrt(sum/L)/(o/L) 
%%
L = length(buck_e_v)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (boost_e_v(k) - boost_s_v(k))^2;
    o = o + boost_s_v(k);
end
NRMSE_boost_v = sqrt(sum/L)/(o/L) 
%%
L = length(buck_e_i)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (buck_boost_e_i(k) - buck_boost_s_i(k))^2;
    o = o + buck_boost_s_i(k);
end
NRMSE_buck_boost_i = sqrt(sum/L)/(o/L) 
%%
L = length(buck_e_v)
sum = 0;
o = 0 ;
for k = 1:L
    sum = sum + (buck_boost_e_v(k) - buck_boost_s_v(k))^2;
    o = o + buck_boost_s_v(k);
end
NRMSE_buck_boost_i = sqrt(sum/L)/(o/L) 