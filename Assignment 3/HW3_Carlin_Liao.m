%% E 7 - HW 3: Conditional Statements and Loops
%% Carlin Liao

%% Variables for Problem 1
X_input = 'Test string';

%% Problem 1

if ischar(X_input)
    Y_output = upper(X_input);
elseif isnumeric(X_input)
    Y_output = zeros(size(X_input));
    for i = 1:length(X_input)
       if  X_input(i) < -2
           Y_output(i) = -1/(X_input(i)^2+1);
       elseif  X_input(i) >= -2 && X_input(i) < -1
           Y_output(i) = sin(X_input(i));
       elseif  X_input(i) >= -1 && X_input(i) < 1
           Y_output(i) = X_input(i)^2;
       elseif  X_input(i) >= 1 && X_input(i) < 2
           Y_output(i) = 2;
       elseif  X_input(i) >= 2
           Y_output(i) = 1/(X_input(i)+1);
       end
    end
elseif islogical(X_input)
    Y_output = X_input;
    for i = 1:length(X_input)
        if  X_input(i) == 1
           Y_output(i) = 0;
        elseif  X_input(i) == 0
           Y_output(i) = 1;
        end
    end
else
    Y_output = NaN;
end
Y_output

%% Variables for Problem 2
Shape = 'triangle';

%% Problem 2
switch Shape
    case 'triangle'
        numSides = 3
    case 'square'
        numSides = 4
    case 'pentagon'
        numSides = 5
    case 'hexagon'
        numSides = 6
    case 'heptagon'
        numSides = 7
    case 'octagon'
        numSides = 8
    otherwise
        if strcmp(Shape(length(Shape)-2:length(Shape)), 'gon')
            disp(['I don''t know how many sides a ', Shape, ' has.'])
        else
            disp(['I don''t know what a ', Shape, ' is.'])
        end
end
      

%% Variables for Problem 3
numRows = 100;
Value1 = 3;
Value2 = 5;

%% Problem 3

Prob3 = zeros(numRows,1);
for i= 1:numRows
    if mod(i,Value1) == 0 && mod(i,Value2) ~= 0
        Prob3(i,1) = inf;
    elseif mod(i,Value1) ~= 0 && mod(i,Value2) == 0
        Prob3(i,1) = -inf;
    elseif mod(i,Value1) == 0 && mod(i,Value2) == 0
        Prob3(i,1) = NaN;
    else
        Prob3(i,1) = i;
    end
end
Prob3


%% Variables for Problem 4
A = [1 2; 3 4];
B = [1 10 100];

%% Problem 4 - Kronecker Product
[rowsA, colsA] = size(A);
[rowsB, colsB] = size(B);
Kronecker = zeros(rowsA*rowsB,colsA*colsB);
for i = 1:rowsA
    for j = 1:colsA
        Kronecker((i-1)*rowsB+1:(i-1)*(rowsB)+1+rowsB-1,(j-1)*colsB+1:(j-1)*colsB+1+colsB-1) = A(i,j)*B;
    end
end
Kronecker
            

%% Variables for Problem 5
Paid = 1000;
Cost = 873;

%% Problem 5
Change = zeros(1,7);
amount = Paid - Cost;
denom = [100 50 20 10 5 2 1];

for i = 1:7
    Change(i) = floor(amount/denom(i));
    amount = mod(amount,denom(i));
end
Change

%% Variables for Problem 6
levelVals = [13, 2, 7];

%% Problem 6
n = 2*length(levelVals)-1;
if mod(length(levelVals),2) == 0
    thing = 2;
else
    thing = 1;
end
boxArray = zeros(n);

for k = 1:length(levelVals)
    boxArray(k:n-k+1,k:n-k+1) = levelVals(n-k-thing)*ones(n-2*(k-1));
end
boxArray

%% Variables for Problem 7
load sensorData

%% Problem 7
i = 1;
noDatas = 0;
elevation_estimates = [];
lastAverage = NaN;
while noDatas < 31
    thisMeasure = measurements(i,:);
    thisMeasure = thisMeasure(~isnan(thisMeasure));
    if isempty(thisMeasure)
        noDatas = noDatas + 1;
    else
        lastAverage = mean(thisMeasure);
    end
    elevation_estimates = [elevation_estimates;lastAverage];
    i = i+1;
end
elevation_estimates 


%% Variables for Problem 8a
V = [1, 1, 0, 1, 0, 1, 1, 0, 1];

%% Problem 8a
i=0;
for i = 3:3:length(V)
    V(i) = ~V(i);
end
V

%% Variables for Problem 8b
V = [1, 1, 0, 1, 0, 1, 1, 0, 1];

%% Problem 8b
j=0;
for i = 1:length(V)
    if V(i) == 1
        j = j+1;
        if j == 3
            j = 0;
            V(i) = ~V(i);
        end
    end
end
V

%% Variables for Problem 8c
V = [0, 1, 0, 1];

%% Problem 8c
numChanges = 0;
for i = 2:length(V)
    if V(i-1) ~= V(i)
        numChanges = numChanges + 1;
    end
end
numChanges

%% Variables for Problem 8d
V = [0, 1, 0, 1, 0];
pattern = [0, 1, 0];

%% Problem 8d
numOccurs = 0;
for i = 1:(length(V) - length(pattern) + 1)
    if V(i:(i + length(pattern) - 1)) == pattern
        numOccurs = numOccurs + 1;
    end
end
numOccurs

%% Variables for Problem 8e
V = [0, 1, 0, 1, 0];
pattern = [0, 1, 0];

%% Problem 8e
numOccursSep = 0;
i = 1;
while i < length(V) - length(pattern) + 1
    if isequal(V(i:(i + length(pattern) - 1)), pattern)
        numOccursSep = numOccursSep + 1;
        i = i + length(pattern);
    else
        i = i + 1;
    end
end
numOccursSep

%% Variables for Problem 8f
V = [1, 0, 0, 0, 1];
seqRemove = [0, 0];
seqNew = [1,0];

%% Problem 8f
i = 1;
while i <= length(V) - length(seqNew) + 1
    if isequal(V(i:(i + length(seqNew) - 1)), seqRemove)
        V(i:(i + length(seqNew) - 1)) = seqNew;
        i = i + length(seqNew);
    else
        i = i + 1;
    end
end
V