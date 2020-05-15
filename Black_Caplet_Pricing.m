function [ caplet_price ] = Black_Caplet_Pricing(T_iminus1,K,F,notion,P_Ti,tau,sigma)
caplet_price = notion*tau*P_Ti*blsprice(F,K,0,T_iminus1,sigma); 
end

