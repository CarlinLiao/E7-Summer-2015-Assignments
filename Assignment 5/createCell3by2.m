function [ Caa, Chv, Chvc ] = createCell3by2()
%For the purposes of autograding. All three should be the same cell array.

Caa = cell(3,2);
Caa{1,1} = 'ABCD';
Caa{1,2} = [0 0 0; 1 1 1];
Caa{2,1} = [1 2; 3 4; 5 6];
Caa{2,2} = @(x) sin(x);
Caa{3,1} = [{2013}, {'UC Berkeley'}];
Caa{3,2} = struct('A',[1,2;3,4],'B','GoBears');

Chv = [{'ABCD'}, {[0 0 0; 1 1 1]}; {[1 2; 3 4; 5 6]}, {@(x) sin(x)};...
    {[{2013}, {'UC Berkeley'}]} {struct('A',[1,2;3,4],'B','GoBears')}];

Chvc = { ['ABCD'], [0 0 0; 1 1 1]; [1 2; 3 4; 5 6], @(x)sin(x);...
    {{2013}, {'UC Berkeley'}}, struct('A',[1,2;3,4],'B','GoBears') };

end

