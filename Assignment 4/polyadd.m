function pSum = polyadd(p1,p2)
% takes row vectors p1 and p2, interpreted as coefficients of two
% polynomials and returns the row vector that contains the coefficients of
% the sum of the two polynomials.

if numel(p1)<numel(p2)
    p1 = LOCALpadrv(p1,numel(p2)); 
elseif numel(p2)<numel(p1)
    p2 = LOCALpadrv(p2,numel(p1));
end

pSum = bsxfun(@plus,p1,p2);
pSum = LOCALunpad(pSum);

end

function vpad = LOCALpadrv(v,n)

vpad = v;
while numel(vpad) < n
    vpad = [0 vpad];
end

end

function b = LOCALunpad(v)

b = v;
found = find(b);
if ~isempty(find(b))
    b = b(found(1):numel(b));
end

end
