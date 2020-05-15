function [ ZBP ] = HW_ZBPut_SM_T(t,T,S,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T)
M = 10000; %number of simulations
a = kappa;
%calculate A B
B_TS = (1-exp(-a*(S-T)))/a;
A_TS = (PM_S/PM_T)*exp(B_TS*fm_T-sigma*sigma*(1-exp(-2*a*T))*B_TS*B_TS/(4*a));
% simulate rT under T numeraire(text book p124)
M_tT = sigma*sigma*(1-exp(-a*(T-t)))/(a*a)-sigma*sigma*(exp(-a*(T-T))...
        - exp(-a*(T+T-2*t)))/(2*a*a);
xt = rt;
alpha_T = fm_T+sigma*sigma*(1-exp(-a*T))^2/(2*a*a);
mu_rT = xt * exp(-a*(T-t)) - M_tT + alpha_T;
var_rT = sigma*sigma*(1-exp(-2*a*(T-t)))/(2*a);
rT = normrnd(mu_rT,sqrt(var_rT),M,1);
% bond price
P_tT = HW_ZBPrice_CF(t,T,kappa,sigma,rt,PM_t,PM_T,fm_t);
% put together(L2 p16)
payoff = max(zeros(M,1),X - A_TS*exp(-B_TS*rT));
ZBP = P_tT*mean(payoff);
end



