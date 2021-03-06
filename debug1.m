% parameters
kappa = 8.251778267845030e-04;
sigma = 0.006652325725761;
rt = 0.049999524732887;

%[8.251778267845030e-04,0.006652325725761,0.049999524732887]
% 0.075858147111211
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
for i=2:n
    i
    %ZBput_CF(i) = HW_ZBPut_CF(t,T_iM1(i),T_i(i),0.95,kappa,sigma,rt,PM_t,Discount(i-1),Discount(i),fm_t);
    %ZBput_Q(i) = HW_ZBPut_SM_Q(t,T_iM1(i),T_i(i),0.95,kappa,sigma,rt,PM_t,Discount(i-1),Discount(i),fm_t,fm(i));
    %ZBput_T(i) = HW_ZBPut_SM_T(t,T_iM1(i),T_i(i),0.95,kappa,sigma,rt,PM_t,Discount(i-1),Discount(i),fm_t,fm(i));
    Caplet_Price(i) =  HW_Caplets(0,T_iM1(i),T_i(i),tau_i(i),Notional(i),CapStrike(i),kappa,sigma,rt,1,Discount(i-1),Discount(i),fm_t);
    imp_vol(i) = Caplet_Price_to_Vol(Caplet_Price(i),T_iM1(i),CapStrike(i),ResetRate(i),Notional(i),Discount(i),tau_i(i));
end
figure
plot(T_i,imp_vol,'b-',T_i,CapVols,'r-');
xlabel('t');
ylabel('IV');
legend('HW IV','BL IV');

figure
plot(T_i,Caplet_Price,'b-',T_i,PV,'r-');
xlabel('t');
ylabel('Caplet Price');
legend('HW caplet','BL caplet');

