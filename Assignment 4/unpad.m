function b = unpad(v)
% takes a row vector w, removes all zeros at the beginning of the vector and returns the remaining elements of the vector

b = v;
found = find(b);
if ~isempty(find(b))
    b = b(found(1):numel(b));
end

end

