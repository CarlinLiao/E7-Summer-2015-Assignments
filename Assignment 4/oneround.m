function [dH1, dE1, dH2, dE2] = oneround(u1,u2,a,b,c,d,A,B,D)
% Determines change to both player's health and endurance after one round

u = char([u1 u2]);

switch u
    case char([1 1])
        dH1=-A;
        dE1=-a;
        dH2=-A;
        dE2=-a;
    case char([1 2])
        dH1=-B;
        dE1=-a;
        dH2=-A;
        dE2=-b;
    case char([1 3])
        dH1=0;
        dE1=-a;
        dH2=0;
        dE2=-c;
    case char([1 4])
        dH1=0;
        dE1=-a;
        dH2=D-A;
        dE2=d;
    case char([2 1])
        dH1=-A;
        dE1=-b;
        dH2=-B;
        dE2=-a;
    case char([2 2])
        dH1=-B;
        dE1=-b;
        dH2=-B;
        dE2=-b;
    case char([2 3])
        dH1=0;
        dE1=-b;
        dH2=0;
        dE2=-c;
    case char([2 4])
        dH1=0;
        dE1=-b;
        dH2=D-B;
        dE2=d;
    case char([3 1])
        dH1=0;
        dE1=-c;
        dH2=0;
        dE2=-a;
    case char([3 2])
        dH1=0;
        dE1=-c;
        dH2=0;
        dE2=-b;
    case char([3 3])
        dH1=0;
        dE1=-c;
        dH2=0;
        dE2=-c;
    case char([3 4])
        dH1=0;
        dE1=-c;
        dH2=D;
        dE2=d;
    case char([4 1])
        dH1=D-A;
        dE1=d;
        dH2=0;
        dE2=-a;
    case char([4 2])
        dH1=D-B;
        dE1=d;
        dH2=0;
        dE2=-b;
    case char([4 3])
        dH1=D;
        dE1=d;
        dH2=0;
        dE2=-c;
    case char([4 4])
        dH1=D;
        dE1=d;
        dH2=D;
        dE2=d;
end


% Randomize health/endurance change by +-15% if nonzero, +-.1 if zero
if dH1 == 0
    dH1 = (.2*(rand-0.5));
else
    dH1 = dH1*(1+0.15*(2*(rand-0.5)));
end
if dE1 == 0
    dE1 = (.2*(rand-0.5));
else
    dE1 = dE1*(1+0.15*(2*(rand-0.5)));
end
if dH2 == 0
    dH2 = (.2*(rand-0.5));
else
    dH2 = dH2*(1+0.15*(2*(rand-0.5)));
end
if dE2 == 0
    dE2 = (.2*(rand-0.5));
else
    dE2 = dE2*(1+0.15*(2*(rand-0.5)));
end

end

