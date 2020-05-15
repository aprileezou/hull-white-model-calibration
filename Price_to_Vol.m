function [vol] = Price_to_Vol(price,D)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% read data

%bi-section
tol = 10^-6;
lower = 0;
flower = Black_Cap_Pricing(D, lower) - price;
upper = 1;
fupper = Black_Cap_Pricing(D, upper) - price;
while fupper <0
    upper = 2 * upper;
    fupper = Black_Cap_Pricing(D, upper) - price;
end
guess = 0.5*(lower + upper);
fguess = Black_Cap_Pricing(D,guess) - price;
while upper - lower > tol
    if fupper * fguess<0 % in upper half
        lower = guess;
        flower = fguess;
        guess = 0.5*(lower + upper);
        fguess = Black_Cap_Pricing(D,guess) - price;
    else % in lower half
        upper = guess;
        fupper = fguess;
        guess = 0.5*(lower + upper);
        fguess = Black_Cap_Pricing(D,guess) - price;
    end
end

vol = guess;

end

