function [ ZBPrice ] = HW_ZBPrice_SM(t,T,kappa,sigma,rt,PM_t,PM_T,fm_t)
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
% PM_t ==1; fm_t==0;t=0

M = 10000; 
a=kappa;
B = (1-exp(-a*(T-t)))/a;
alpha = fm_t+sigma*sigma*(1-exp(-a*t))^2/(2*a*a);
V_t_T = sigma*sigma*(T-t+2*exp(-a*(T-t))/a-exp(-2*a*(T-t))/(2*a)-1.5/a)/(a*a);
V_0_T = sigma*sigma*(T-0+2*exp(-a*(T-0))/a-exp(-2*a*(T-0))/(2*a)-1.5/a)/(a*a);
V_0_t = sigma*sigma*(t-0+2*exp(-a*(t-0))/a-exp(-2*a*(t-0))/(2*a)-1.5/a)/(a*a);

% simulation for rt
%mu = rt*exp(-a*t)+alpha-0; %assume s=0
%var = sigma*sigma*(1-exp(-2*a*(t)))/(2*a); %variance of rt

%r_t = normrnd(mu,sqrt(var),M,1);

mu_integral = B*(rt-alpha)+log(PM_t/PM_T)+(V_0_T-V_0_t)/2;
var_integral = V_t_T;
%r_integral = zeros(M,1);


r_integral = normrnd(mu_integral,sqrt(var_integral),M,1);


% simulation for priceSM
priceSM = exp(-1*r_integral);

ZBPrice = mean(priceSM);


    


end

