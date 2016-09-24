function [ result ] = random_coin_toss( coins )
% does one trial, randomly choosing a coin from coins (an array of function
% handles) and returning the result

result = coins{randi(numel(coins))}();

end

