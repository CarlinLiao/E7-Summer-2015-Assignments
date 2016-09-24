function value = pascalsTriangle(row, col)
% calculates pascal's triange for a given row, column pair

if row <= 0 || col <= 0 || ~isnumeric(row) || ~isnumeric(col)
    Error('Invalid row and/or column indices');
elseif col == 1 || col == row
    value = 1;
else
    value = pascalsTriangle(row-1,col-1) + pascalsTriangle(row-1,col);
end

end

