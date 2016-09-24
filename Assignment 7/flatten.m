function flatArray = flatten(deepcell)
% Flattens deepcells, or a cell array of doubles and cell arrays of doubles

flatArray = [];

for i = 1:length(deepcell)
    if isa(deepcell{i},'double')
        flatArray = [flatArray deepcell{i}];
    elseif isa(deepcell{i},'cell')
        flatArray = [flatArray flatten(deepcell{i})];
    else
        error('Not a deepcell');
    end
end


end

