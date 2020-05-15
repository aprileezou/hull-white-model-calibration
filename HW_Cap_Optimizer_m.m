function [ SqError ] = HW_Cap_Optimizer_m(parameters)
kappa=parameters(1);
sigma=parameters(2);
rt=parameters(3);

% import data
load('cap.mat');
CapVols = CapVols/100;
CapStrike = CapStrike/100;
ResetRate = ResetRate/100;
%constant setting
t = 0;
PM_t = 1;
fm_t = rt;
X = CapStrike(1);
% calculate market observed forward rate
log_P = log(Discount);
fm = -[0;diff(log_P)]./tau_i;
fm(1) = rt;

n = size(Payment,1);
vol_hat = zeros(n,1);
vol_hat(1) = CapVols(1);
for i=2:n
    i
    price =  HW_Caplets(0,T_iM1(i),T_i(i),tau_i(i),Notional(i),CapStrike(i),kappa,sigma,rt,1,Discount(i-1),Discount(i),fm_t);
    vol_hat(i) = Caplet_Price_to_Vol(price,T_iM1(i),CapStrike(i),ResetRate(i),Notional(i),Discount(i),tau_i(i));
    
end
SqError = sum((vol_hat - CapVols).^2);
end

