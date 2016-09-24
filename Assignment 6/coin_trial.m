function [ result ] = coin_trial( coins )
% does one trial, flipping all the coins (an array of function handles) and
% returning an array of the result

result = zeros(size(coins));
for i = 1:length(coins)
    result(i) = coins{i}();
end

end

