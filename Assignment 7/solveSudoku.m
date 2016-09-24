function cellSolutions = solveSudoku(PuzzleA)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

cellSolutions = [];

if accept(PuzzleA)
    cellSolutions = PuzzleA;
    return;
elseif sum(sum(isnan(PuzzleA))) ~= 0
    [P, Idx] = firstChild(PuzzleA);
    cellSolutions = solveSudoku(firstChild(PuzzleA));
    while ~isempty(nextChild(P, Idx))
        cellSolutions = [cellSolutions solveSudoku(nextChild(P, Idx))];
    end
end


end






function L = rejectOnRows(P)
L = 0;

for i = 1:9 % rows
    for n = 1:9 % numbers
        if length(find(P(i,:) == n)) > 1
            L = 1;
            return
        end
    end
end


end

function L = rejectOnColumns(P)
L = 0;

for i = 1:9 % columns
    for n = 1:9 % numbers
        if length(find(P(:,1) == n)) > 1
            L = 1;
            return
        end
    end
end


end

function L = rejectOnBlocks(P)
L = 0;
b = cell(3);

% there's probably a better way to do this but i don't want to spend the
% time trying to figure it out
b{1} = P(1:3,1:3);
b{2} = P(4:6,1:3);
b{3} = P(7:9,1:3);
b{4} = P(1:3,4:6);
b{5} = P(4:6,4:6);
b{6} = P(7:9,4:6);
b{7} = P(1:3,7:9);
b{8} = P(4:6,7:9);
b{9} = P(7:9,7:9);


for i = 1:9 % blocks
    for n = 1:9 % numbers
        if length(find(b{i} == n)) > 1
        L = 1;
        return
        end
    end
end


end

function L = reject(P)
L = 0;
if rejectOnRows(P) || rejectOnColumns(P) || rejectOnBlocks(P)
    L = 1;
end

end

function L = accept(P)

L = ~reject(P) && sum(sum(isnan(P))) == 0;

end

function [nP, Idx] = firstChild(P)

if sum(isnan(P)) == 0
    nP = [];
    Idx = [];
else
    nP = P;
    for i = 1:numel(P)
        if isnan(P(i))
            nP(i) = 1;
            Idx = i;
            return;
        end
    end
end


end

function [nP] = nextChild(P,Idx)

if P(Idx) >= 9
    nP = [];
else
    nP = P;
    nP(Idx) = P(Idx) + 1;
end

end