function U = fun(Ts,d,t)
mo = t/Ts;
L = mo - floor(mo) ;
if L<=d
    U = 1;
end
if L>d
    U=0;
end
end