function [Pswitch,Pno_switch] = monty_Hall(N)
% Simulates Monty Hall's classical probability problem
% N is the number of trials (i.e. contestants)
% Simulate the event that the prize is behind either door 1,2,or 3
% door_with_prize is the door number that has the prize
% each row is a trial
door_with_prize = randi([1 3],[N 1]);

% Assume that contestant picks door 1 every time (no loss of generality)
% Determine # of trials when prize is door 1

prize_in_door_one = (ones(N,1) == door_with_prize);

% Determine probability of winning prize by not switching

Pno_switch = sum(prize_in_door_one)/N;

% Determine door shown by Monty Hall to contestant
% This door, which is never door 1, contains a dud

Monty_door = zeros(N,1); % space allocation for Monty's door selection

% When prize is in door 1, Monty chooses randomly between doors 2 and 3;
% When prize is not in door 1, Monty choose the door that contains a dud

for i = 1:N
    switch door_with_prize(i)
        case 1
            Monty_door(i) = randi(2)+1;
        case 2
            Monty_door(i) = 3;
        case 3
            Monty_door(i) = 2;
    end
end

% Assume that contestant chooses neither door 1 nor Monty's door
% and switches to remaining door

door_switch = zeros(N,1);
for i = 1:N
    if Monty_door(i) == 2
        door_switch(i) = 3;
    else
        door_switch(i) = 2;
    end
end

% Determine # of trials when prize is in the switched door

prize_in_door_switch = (door_switch == door_with_prize);

% Determine probability of winning prize by switching
Pswitch = sum(prize_in_door_switch)/N;