function [bmuL, bsigmaL ] = PlaneDist(Wmin,Wmax,N,M,Nbins,Nfig)
% It sort of does what 5c asks for. See the comment at the trouble point
% for more details on the troubling stuff about the histogram.


[muL, sigmaL, L ] = plane(Wmin,Wmax,N,M);
bmuL = mean(L);
bsigmaL = std(L);

x = linspace(bmuL-3*bsigmaL,bmuL+3*bsigmaL,Nbins-1);

figure(Nfig);
h = histogram(L,Nbins);
probs = h.Values/M^1.62; % fraction of trials that hit in these Nbins would
% be just dividing by M, but for some reason, the scaling of the histogram
% doesn't match the scaling of the pdf line. I took M to the 1.62 so that
% they would line up more closely.
xvals = linspace(h.BinLimits(1),h.BinLimits(2),Nbins);
clf;
bar(xvals,probs,.8);
hold on;
plot(x,normpdf(x,bmuL,bsigmaL),'--rs','MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','g');


end

