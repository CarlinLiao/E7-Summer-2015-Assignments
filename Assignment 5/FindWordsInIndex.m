function matchingDocs = FindWordsInIndex(Index, words)
% stuff

matchingDocs = [];

switch ischar(words) + 2*iscell(words)
    case 1
        for i = 1:length(Index)
            if strcmpi(Index(i).Word,words)
                matchingDocs = Index(i).Documents;
                return;
            end
        end
    case 2
        for j = 1:length(words)
            for i = 1:length(Index)
                if strcmpi(Index(i).Word,words(j))
                    matches(j) = {[matchingDocs Index(i).Documents]};
                    break;
                end
            end
        end
        %compare all matches and return only triple duplicates
        matchingDocs = matches{1};
        for k = 2:length(matches) % starts with matches{2}
            matchingDocs = intersect(matchingDocs,matches{k});            
        end        
    otherwise
        error('Please input either a string or a cell array in the second field.');
end




end

