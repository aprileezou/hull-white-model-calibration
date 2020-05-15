function [ Cap ] = HW_Cap(t,T_iM1,T_i,tau_i,Notional,CapStrike,kappa,sigma,rt,Discount,fm,PV)
%fm_t = 0
Cap = PV(1);
n = size(T_i,1);
for i=2:n
    Cap = Cap + HW_Caplets(0, T_iM1(i),T_i(i),tau_i(i),Notional(i),CapStrike(i),kappa,sigma,rt,1,Discount(i-1),Discount(i),fm(1),fm(i));
end

end

