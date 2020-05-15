function [ ZBP ] = HW_ZBPut_SM_Q(t,T,S,X,kappa,sigma,rt,PM_t,PM_T,PM_S,fm_t,fm_T)
%Lecture 2, P 16
M = 1000000; %number of simulations
a = kappa;


% CALCULATE A B L3,p15
B_TS = (1-exp(-a*(S-T)))/a; 
A_TS = (PM_S/PM_T)*exp(B_TS*fm_T-sigma*sigma*(1-exp(-2*a*T))*B_TS*B_TS/(4*a));
% mu and var of rT under information set t(L3 3.37)
alpha_T = fm_T+sigma*sigma*(1-exp(-a*T))^2/(2*a*a);
alpha_t = fm_t+sigma*sigma*(1-exp(-a*t))^2/(2*a*a);
mu_rT = rt*exp(-a*(T-t))+alpha_T-alpha_t*exp(-a*(T-t));
var_rT = sigma*sigma*(1-exp(-2*a*(T-t)))/(2*a);
rT = normrnd(mu_rT,sqrt(var_rT),M,1);

% simulate intergral term
B_tT = (1-exp(-a*(T-t)))/a;
V_t_T = sigma*sigma*(T-t+2*exp(-a*(T-t))/a-exp(-2*a*(T-t))/(2*a)-1.5/a)/(a*a);
V_0_T = sigma*sigma*(T-0+2*exp(-a*(T-0))/a-exp(-2*a*(T-0))/(2*a)-1.5/a)/(a*a);
V_0_t = sigma*sigma*(t-0+2*exp(-a*(t-0))/a-exp(-2*a*(t-0))/(2*a)-1.5/a)/(a*a);
mu_inte = B_tT*(rt-alpha_t)+log(PM_t/PM_T)+(V_0_T-V_0_t)/2;
var_inte = V_t_T;
inte_term = normrnd(mu_inte,sqrt(var_inte),M,1);

% put together
SDF = exp(-inte_term);
payoff = max(zeros(M,1),X - A_TS*exp(-B_TS*rT));

ZBP = SDF.*payoff;
ZBP = mean(ZBP);

end

