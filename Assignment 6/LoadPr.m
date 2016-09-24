function Pr = LoadPr(Wmin,Wmax,N,LM )
% Calculates probability that the plane load will be greater than LM
% assuming a gaussian distribution of possible weights based on the mean
% and standard deviation given by plane()

[muL, sigmaL, L ] = plane(Wmin,Wmax,N,0);
Pr = 1-(1/2)*(1+erf((LM-muL)/(sigmaL*sqrt(2))));


end

