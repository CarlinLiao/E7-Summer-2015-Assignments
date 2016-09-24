function idxInterval = bsearchRepeats(A,Key)
% takes a sorted array A and key value Key and returns the start and end
% points (if existant) idxInterval in a 1 by 0, 1, or 2 array

bin1 = A(1:floor(numel(A)/2));
bin2 = A(ceil(numel(A)/2):end);

i = floor(numel(A)/2);
right = [];
while i >= 1
    if A(i) >= Key
        i = i - 1;
        % A(i) 
    	if A(i) == Key && isempty(right)
            right = i;
        end
    else
        break;
        % A(i) is less than Key
        % A(i+1) is equal to or greater than Key
    end
end

j = ceil(numel(A)/2);
left = [];
while j <= numel(A)
    if A(j) <= Key
        j = j + 1;
        % A(j) 
    	if A(j) == Key && isempty(left)
            right = j;
        end
    else
        break;
        % A(j) is greater than Key
        % A(j+1) is equal to or less than Key
    end
end

if A(i+1) == Key
    idxInterval(1) = i+1;
elseif ~isempty(left)
    idxInterval(1) = left;
else
    idxInterval = [];
end

if A(j-1) == Key
    idxInterval(2) = j-1;
elseif ~isempty(right)
    idxInterval(2) = right;
end

end

