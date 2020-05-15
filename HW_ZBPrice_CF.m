function [ ZBPrice ] = HW_ZBPrice_CF(t,T,kappa,sigma,rt,PM_t,PM_T,fm_t) 
%   fm_t is calculated using ln(PM_t+delta t)
% PM_t is 1 here
a=kappa;
B = (1-exp(-a*(T-t)))/a;
A = (PM_T/PM_t)*exp(B*fm_t-sigma*sigma*(1-exp(-2*a*t))*B*B/(4*a));
%alpha = fm_t+sigma*sigma*(1-exp(-a*t))^2/(2*a*a);
%mu = rt*exp(-a*t)+alpha-0; %assume s=0
%var = sigma*sigma*(1-exp(-2*a*(t)))/(2*a); %variance of rt
ZBPrice = A*exp(-B*rt);

end

