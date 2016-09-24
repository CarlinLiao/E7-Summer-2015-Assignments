function outVec = flipNth(inVec,N)
% flips every Nth entry of the input vector (0 to 1 or 1 to 0) and returns the modified vector.

switch nargin
    case 1
        N=1;
    case 2
    otherwise
        error('Need 1 to 2 inputs, 2 preferred.')
end

outVec = inVec;
for i = 1:( floor(numel(inVec)/N) )
    switch outVec(i*N)
        case 0
            outVec(i*N) = 1;
        case 1
            outVec(i*N) = 0;
    end
end

end