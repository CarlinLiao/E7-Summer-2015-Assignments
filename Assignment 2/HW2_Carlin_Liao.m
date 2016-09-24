%% E7 HW2: Arrays and Relational Operators
%%  Carlin Liao
%%  E7 Summer 2015

%% Problem 1

A1 = [.8 -1.4; 4.7 5.7; 8.8 1.2]
A2 = A1(1,2)
A3 = [A1 zeros(3,1)]
A4 = cat(1, A1(1:2,:), zeros(1,2), A1(3,:))
A5 = find(A4==5.7)
A6 = repmat(transpose(A4),1,2)
A7 = A6;
A7(2,3) = -4.9
A8 = A7;
A8([3 8]) = [6 14]

%% Problem 2

Mon = (ones(4,1)*(5*60+5))./transpose(4:-1:1)
Tue = Mon*.95
coeff = bsxfun(@power,(.95*ones(4,7)),0:6);
oneMilePlan = bsxfun(@times,repmat(Mon,1,7),coeff)
subFour = oneMilePlan(4,7) < 4*60 

%% Problem 3

twoMilePlan = oneMilePlan*2;
twoMilePlan(1, 1:7) = twoMilePlan(1,1:7)+10

%% Variables for Problem 4
initialTime = 255;
improveRate = 5;
numDays = 7;

%% Problem 4

firstDay = (ones(4,1)*(initialTime))./transpose(4:-1:1);
improvePercent = bsxfun(@power,((1-improveRate*.01)*ones(4,numDays)),0:numDays-1);
trainingPlan = bsxfun(@times,repmat(firstDay,1,numDays),improvePercent)


%% Variables for Problem 5
raceTime = 255;

%% Problem 5

minutes = floor(raceTime/60)
seconds = mod(raceTime,60)
message = ['Johnny''s time is ', num2str(minutes), ' minutes and ', num2str(seconds), ' seconds. That is, ' num2str(minutes), ':', num2str(seconds), '.'];
disp(message)

%% Variables for Problem 6
sentence1 = 'Prof. Horowitz is an E7 instructor';
string1 = 'Horowitz';
string2 = 'Packard';

%% Problem 6

toRepl = strfind(sentence1, string1);
sentence2 = [sentence1(1:toRepl(1)-1), string2, sentence1((toRepl(1)+length(string1)):length(sentence1))] 

%% Variables for Problem 7
R = 9;
Rstop = 10;
CounterVal = 6;
CounterMaxLimit = 10;

%% Problem 7

KeepCounting = R ~= Rstop && CounterVal <= CounterMaxLimit
 
%% Variables for Problem 8
A = [1, 2, 3, 4];
B = [1, 3, 2, 2];

%% Problem 8

% A & B are given as column arrays, so only need to check rows
expProduct = size(A,2) == size(B,2) && sum(A.^B) > 30 

%% Variables for Problem 9a
load Baseball.mat
playerNum = 18;

%% Problem 9a
bestYear = sum(BattingAverages(playerNum,:) == max(BattingAverages)) > 0


%% Variables for Problem 9b
playerNum = 23;

%% Problem 9b

worstYear = sum(BattingAverages(playerNum,:) == min(BattingAverages)) > 0


%% Variables for Problem 9c
playerNum = 89;

%% Problem 9c

bestAverage = mean(BattingAverages(playerNum,:)) == max(mean(transpose(BattingAverages)))

%% Variables for Problem 9d
playerNum = 27;

%% Problem 9d

improvement = sum(BattingAverages(playerNum,2:size(BattingAverages,2)) > BattingAverages(playerNum,1:size(BattingAverages,2)-1)) == size(BattingAverages,2)-1

%% Variables for Problem 9e
playerNum = 1;

%% Problem 9e

allStar = sum(BattingAverages(playerNum,:) > .4) >= 4

%% Variables for Problem 9f
playerNum = 12;
yearNum = 4;

%% Problem 9f

[betterPlayers,col] = find(BattingAverages(:,yearNum) > BattingAverages(playerNum,yearNum));
betterPlayers = sort(unique(betterPlayers))

%% Variables for Problem 9g
playerNum = 10;

%% Problem 9g

[betterAveragePlayers,col] = find(transpose(mean(transpose(BattingAverages))) > mean(BattingAverages(playerNum,:)));
betterAveragePlayers

%% Variables for Problem 9h
playerNum = 1;
yearNum = 1;

%% Problem 9h

[row,topYear] = find(BattingAverages(playerNum,:) > BattingAverages(playerNum,yearNum));
topYear
