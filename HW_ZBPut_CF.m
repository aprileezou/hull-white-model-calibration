function [ ZBP ] = HW_ZBPut_CF(t,T,S,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t)
% text book p124 3.41
% PM_t is 1 here

a = kappa;
B = (1-exp(-a*(S-T)))/a;
sigma_p = sigma*sqrt((1-exp(-2*a*(T-t)))/(2*a))*B;
P_t_S = HW_ZBPrice_CF(t,S,kappa,sigma,rt,PM_t,PM_S,fm_t); 
P_t_T = HW_ZBPrice_CF(t,T,kappa,sigma,rt,PM_t,PM_T,fm_t); 

h = log(P_t_S/(P_t_T*X))/sigma_p+sigma_p/2;

ZBP = X*P_t_T*normcdf(-h+sigma_p)-P_t_S*normcdf(-h);
end

