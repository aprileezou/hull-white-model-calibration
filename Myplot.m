kappa = 0.3;
%kappa = 0.3:0.01:0.5;
sigma = 0:0.005:0.1;
rt = 0:0.005:0.1;


result_Vol_Panelty = zeros(length(rt),length(sigma));
result_pct_error = zeros(length(rt),length(sigma));
for i = 1:length(rt)
    for j = 1:length(sigma)
        parameters = [kappa,sigma(j),rt(i)];
        result_Vol_Panelty(i,j) = HW_Cap_Optimizer_m(parameters);
        result_pct_error(i,j) = HW_Cap_PricingError(parameters);
    end
end
figure
surf(rt,sigma,result_Vol_Panelty);
xlabel('sigma');
ylabel('rt');

figure
surf(rt,sigma,result_pct_error);
xlabel('sigma');
ylabel('rt');
