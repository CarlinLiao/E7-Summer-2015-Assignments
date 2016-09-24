function outVec = flipNthVal(inVec,N,value)
% flip every Nth instance of a specified value (0 or 1) in an input vector and return the modified vector.

switch nargin
    case 1
        N = 1;
        value = 1;
    case 2
        value = 1;
    case 3
    otherwise
        error('Need between 1 and 3 inputs, 3 preferred.')
end

outVec = inVec;
count = 0;
for i = 1:numel(inVec) % floor(length(find(inVec,value))/N)
    % number of <value> in <inVec> divided by <N> and rounded
    if inVec(i) == value
        count = count+1;
        if mod(count,N) == 0
            outVec(i) = ~outVec(i);
        end
    end    
end
    

end

