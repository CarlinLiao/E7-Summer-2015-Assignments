function [ toss ] = biased_coin_h()
% Simulate a fair coin toss. 0 for tails, 1 for heads.

if randi(10) <= 8
    toss = 1;
else
    toss = 0;
end

end

