function [numAppear, idx] = findWithOverlap(inVec,pattern)
% count how many instances of pattern occur in inVec and identify their indices.

switch nargin
    case 2
    otherwise
        error('Need 2 inputs.')
end

numAppear = 0;
idx = [];
if numel(pattern) > numel(inVec)
    numAppear = [];
    return
end

for i = 1:(length(inVec)-length(pattern)+1)
    if inVec(i:i+length(pattern)-1) == pattern
        numAppear = numAppear + 1;
        idx = [idx i];
    end
end


end

