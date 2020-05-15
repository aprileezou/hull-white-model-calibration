function cap_bl = Black_Cap_Pricing(N,tau,P,F,K,T_iM1,sigma)
caplet=zeros(length(F),1);
for i = 1:length(F)
    caplet(i) = blsprice(F(i),K(i),0,T_iM1(i),sigma(i)); %using bs
end
caplet = N.*tau.*P.*caplet;
cap_bl = sum(caplet);
end