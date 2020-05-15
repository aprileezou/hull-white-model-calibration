function [Caplets] = HW_Caplets(t, T, S,tau,N,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%t_i-1 is T; t_i is S
Xprime = 1/(1+X*tau);
Nprime = N*(1+X*tau);
% if use analitic method to calculate ZBput, then we dont need fm_T
ZBput = HW_ZBPut_CF(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t);
%ZBput = HW_ZBPut_SM_Q(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T);
%ZBput = HW_ZBPut_SM_T(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T);
%HW_ZBput_CF(t,t_im1,t_i,Xprime);
Caplets = Nprime*ZBput;
end

