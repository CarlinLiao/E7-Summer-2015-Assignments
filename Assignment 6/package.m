function [muW, sigmaW] = package(Wmin,Wmax)
% calculates assuming that package weights are uniformly distributed
% between Wmin and Wmax

muW = (Wmax+Wmin)/2;
sigmaW = (Wmax-Wmin)/sqrt(12);

end

