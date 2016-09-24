function [ toss ] = biased_coin_t()
% Simulate a fair coin toss. 0 for tails, 1 for heads.

if randi(10) <= 6
    toss = 0;
else
    toss = 1;
end

end

