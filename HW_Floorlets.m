function [Floorlet] = HW_Floorlets(t, T, S,tau,N,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t)

%t_i-1 is T; t_i is S
Xprime = 1/(1+X*tau);
Nprime = N*(1+X*tau);
% if use analitic method to calculate ZBput, then we dont need fm_T
ZBcall = HW_ZBCall_CF(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t);
%ZBput = HW_ZBPut_SM_Q(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T);
%ZBput = HW_ZBPut_SM_T(t,T,S,Xprime,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T);
%HW_ZBput_CF(t,t_im1,t_i,Xprime);
Floorlet = Nprime*ZBcall;
end

function [ ZBC ] = HW_ZBCall_CF(t,T,S,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t)
ZBP = HW_ZBPut_CF(t,T,S,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t);
P_tT = HW_ZBPrice_CF(t,T,kappa,sigma,rt,PM_t,PM_T,fm_t);
P_tS = HW_ZBPrice_CF(t,S,kappa,sigma,rt,PM_t,PM_T,fm_t);
ZBC = ZBP + P_tS - X*P_tT;
end 
