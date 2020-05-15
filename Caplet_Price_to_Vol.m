function [vol] = Caplet_Price_to_Vol(price,T_iM1,K,F,notion,P_Ti,tau)
% price is generated by HW_caplets
bl = price/(notion*P_Ti*tau);
vol = blsimpv(F,K,0,T_iM1,bl);
%if isnan(vol)%panelty
%    vol = 2;
%end

end

