%% E7 - Assignment 6 - Carlin Liao

%% 1. dateE7 yearE7

% It only took me a week!
% The rest of the homework also took me a week.

%% 2. 

gun1 = @dart_gun01;
gun2 = @dart_gun02;
[ total1, tally1 ] = dart_score(10000,gun1);
% sample tally1 = [55,1437,3227,5281]
% probability of one dart throw obtaining at least 1 point  is about 47%
%                                         at least 5 points is about 15%
%                                          exactly 5 points is about 14%
%                         at least 1 point but not 5 points is about 33%
[ total2, tally2 ] = dart_score(10000,gun2);
% sample tally2 = [104,2409,7487,0]
% probability of one dart throw obtaining at least 1 point  is       79%
%                                         at least 5 points is about 20%
%                                          exactly 5 points is about 19%
%                         at least 1 point but not 5 points is about 60%

%% 3. a-c 

f = @fair_coin;

tri2k = zeros(1000,2);
tri3k = zeros(1000,3);
tri4k = zeros(1000,4);
for i = 1:1000;
    tri2k(i,:) = coin_trial({f f});
    tri3k(i,:) = coin_trial({f f f});
    tri4k(i,:) = coin_trial({f f f f});
end

clf
histogram(sum(tri2k'))
clf
histogram(sum(tri3k'))
clf
histogram(sum(tri4k'))

%% 3. e

h = @biased_coin_h;
t = @biased_coin_t;

tribia6 = zeros(1000,6);
for i = 1:1000;
    tribia6(i,:) = coin_trial({h h t f f f});
end
clf
histogram(sum(tribia6'))
% Approximately a 33% chance of getting 3 tails in a single trial.

%% 3. f
triran = zeros(1000,1);
for i = 1:1000;
    triran(i) = random_coin_toss({h h h t t f f});
end
clf
histogram(triran)

%% 4.

[pswitch,pno] = monty_Hall(1000)

%% 5. 

[muW, sigmaW] = package(2,10);
% muW = 6
% sigmaW = 2.3094

Wmin = 2; Wmax = 10; N = 10000; M = 3;
[muL, sigmaL, L ] = plane(Wmin,Wmax,N,M)
% muL = 60000
% sigmaL = 230.9401
% L = 1.0e+04 * 6.0497 5.9722 5.9821

Wmin = 2; Wmax = 10; N = 10000; M = 1000; Nbins = 20; Nfig = 1;
[bmuL, bsigmaL ] = PlaneDist(Wmin,Wmax,N,M,Nbins,Nfig)

Wmin = 2; Wmax = 10; N = 10000; LM = 60400;
Pr = LoadPr(Wmin,Wmax,N,LM )
