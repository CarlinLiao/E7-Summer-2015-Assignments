function [sampleMean,sampleSdev,employV] = getStats(fh,L,R,N)
% Calculates sample (population?) mean and standard deviation over a given 
% interval using the given interval step

employV = 1;

try
    x = linspace(L,R,N);    
    sampleMean = sum(fh(x))/N;
    sampleSdev = sqrt(sum((fh(x)-sampleMean).^2)/N);
catch
    error('Function is not vectorized. Cannot execute getStats.')
    employV = 0;
end


end