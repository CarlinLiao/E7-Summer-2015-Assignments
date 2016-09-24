function [Index] = InsertDoc(Index, newDoc, DocNum)
% 

for i = 1:length(newDoc)
    wordsIn = 0;
    for j = 1:length(Index)
        if strcmpi(Index(j).Word,newDoc(i)) % Word is already in Index
            loc = find(Index(j).Documents == DocNum); % should only be 1 number
            if ~isempty(loc) % Doc is already in word's index entry
                Index(j).Locations{loc(1)} = [Index(j).Locations{loc(1)} i];
            elseif isempty(loc) % Doc isn't in word's index entry
                Index(j).Documents = [Index(j).Documents DocNum];
                Index(j).Locations = [Index(j).Locations {i}];
            end
            wordsIn = 1;
            break;
        end
    end
    if wordsIn == 0 % Word is not in Index at all
        Index(length(Index)+1) = struct('Word',{newDoc(i)},...
            'Documents',{[ DocNum ]},'Locations',{{i}});
    end
end

end

