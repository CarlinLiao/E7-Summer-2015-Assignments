function vpad = padrv(v,n)
% takes a row vector v and integer n and inserts zeros at the beginning of v to create a new vector which has length n.
% returns original v if n is longer than v

vpad = v;
while numel(vpad) < n
    vpad = [0 vpad];
end

end

