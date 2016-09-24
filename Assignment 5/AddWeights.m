function [ScoresWeighted, B90] = AddWeights(Scores, TaskWeights)
% add the field WeightedTaskScore to Scores and assign to the variable B90
% the names of the students whose WeightedTaskScore is greater than 90

B90 = [];

for i = 1:length(Scores)
    WeightedTaskScore = sum(TaskWeights.*Scores(i).TaskScores);
    ScoresWeighted(i) = struct('Name',Scores(i).Name,'TaskScores',...
        Scores(i).TaskScores,'ScoresWeighted',WeightedTaskScore);
    if WeightedTaskScore > 90
        B90 = [B90 {Scores(i).Name}];
    end
end


end

