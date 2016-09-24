%% E7 - Assignment 7 - Carlin Liao

%% 1. deep_cell

My_deep_cell = {2, 6, {9, 12}, {10.5, 18, {5, 2, 7}, {{6, -2}, 3}}, 6};

flatArray = flatten(My_deep_cell)

%% 2. Pascal's triangle

pascalsTriangle(5, 1)
pascalsTriangle(6, 4)
pascalsTriangle(8, 5)

buildTriangleP(@pascalsTriangle, 10)

%% 3. The Game of Life

clf
inArray = false(20, 20);
inArray(1:3,1:3) = [0, 0, 1; 1, 0, 1; 0, 1, 1];

final = gameOfLife(inArray, 25);
image(100*final)

%% 4. gcd

mygcd(17, 17)
mygcd(15, 9)
mygcd(91, 7)
mygcd(483, 51)
mygcd(10395, 209)
mygcd(25781, 130792)
mygcd(40406123023, 204988078136)

%% 5. sudoku