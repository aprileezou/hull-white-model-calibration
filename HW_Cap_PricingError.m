function [ pctError ] = HW_Cap_PricingError(parameters)
kappa=parameters(1);
sigma=parameters(2);
rt=parameters(3);
kappa
sigma
rt
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
%new change
HWcapletPrice = zeros(n,1);
HWcapletPrice(1) = PV(1);
for i=2:n
    i
    HWcapletPrice(i) =  HW_Caplets(0,T_iM1(i),T_i(i),tau_i(i),Notional(i),CapStrike(i),kappa,sigma,rt,1,Discount(i-1),Discount(i),fm_t);
end
pctDiff = (HWcapletPrice - PV)./PV;
pctError = sum(pctDiff.^2);
% new change ends here

% Black Cap Pricing
%capPrice_bl = Black_Cap_Pricing(Notional,tau_i,Discount,ResetRate,CapStrike,T_iM1,CapVols);
% HW Cap Pricing
%capPrice_hw = HW_Cap(t,T_iM1,T_i,tau_i,Notional,CapStrike,kappa,sigma,rt,Discount,fm,PV);
% diff
%pctError = abs(capPrice_hw-capPrice_bl)/capPrice_bl;
end


