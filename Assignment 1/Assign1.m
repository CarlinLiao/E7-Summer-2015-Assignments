% Carlin Liao
% Assignment 1
% E7 Summer 15
% Anwar

%% Problem 1

a = 4.5;
b = 6;
ang = 35 ;
c = sqrt(a.^2+b.^2-2*a.*b.*cosd(ang))  % law of cosines


%% Problem 2

intvl = 1 ;
theta = 0:intvl:360-intvl ;

s = sind(theta) ;
c = cosd(theta) ;
t = round(tand(theta),3) ;
t_calc = round(s./c,3) ;

if( t_calc == t ) ;
    disp('sin cos tan all good')
else ;
    disp('oh crap, sin cos tan is not all good')
end ;


%% Problem 3

% Assuming one-way trip
B = 74970 ; % joules per alkaline D cell, http://www.allaboutbatteries.com/
powr = 45*745.7; % Watts per horsepower
velc = 35; % mph 
dist = 25; % mi
time = (dist/velc)*3600 ; % hours to seconds
engy = powr*time ; % joules
Dcells = engy / B 


%% Problem 4

% Assuming Anwar has an equal chance of arriving anytime during the bus
% frequency interval.
bus_v = 25 ; %mph
anw_v = 4  ; %mph
dista = 1.5; %mi
bus_t = dista/bus_v; %hr
anw_t = dista/anw_v; %hr
max_wait = anw_t-bus_t ;
bus_freq = 1/(2*max_wait) % buses per hour


%% Problem 5
% x = -4:.1:6 ; 
syms x
y_cp = (5.^2-(x-1).^2).^.5+2  ;
y_cn = -(5.^2-(x-1).^2).^.5+2  ;

% Example line 1
eqn_1 = 2.*x-1 ;
x_1 = double(solve(y_cp-eqn_1)) ;
y_1 = 2.*x_1-1 ;
x_2 = double(solve(y_cn-eqn_1)) ;
y_2 = 2.*x_2-1 ;
intersect_line1 = [x_1 y_1 ; x_2 y_2]

% Example line 2
eqn_2 = -2*x-10 ;
x_1 = double(solve(y_cp-eqn_2)) ;
y_1 = -2*x_1-10 ;
x_2 = double(solve(y_cn-eqn_2)) ;
y_2 = -2*x_2-10 ;
intersect_line2 = 'empty set / complex numbers'

% Example line 3
eqn_3 = x+5.9054 ;
x_1 = double(solve(y_cp-eqn_3)) ;
y_1 = x_1+5.9054 ;
x_2 = double(solve(y_cn-eqn_3)) ;
y_2 = x_2+5.9054 ;
intersect_line3 = [x_1 y_1 ; x_2 y_2]


%% Problem 6

evens   = 6:2:33  ;
threes  = 8:3:38  ;
reverse = 20:-1:10;
theta   = 0:2*pi/100:2*pi ;
myZeros = zeros(1,15);
random  = 12*rand(1,15)


%% Problem 7

nums = [6 3 56 7 8 9 445 6 7 437 357 5 4 3] ;
newNums = nums(1:2:length(nums))


%% Problem 8

% See cub.m

%% Problem 9

jeopardy = zeros(5,6) ;

for(i = 1:6)
    jeopardy(:,i) = 200:200:1000;
end

doubleJeopardy = 2*jeopardy;

matrixJeopardy = jeopardy.^2



%% Problem 10

% See arraycollide.m

% Assume A and B size is greater than m by n

% Combine A and B into one vector
A = [2 4 6 ; 1 5 3];
B = [4 6 ; 8 10 ; 11 13];
M = 6 ;
N = 9 ;

[x_A y_A] = size(A); 
[x_B y_B] = size(B);

A = reshape(A, 1, x_A*y_A); % want one row
B = reshape(B, 1, x_B*y_B);
C = [A B] ;
C = sort(C) ;

if(length(C) < M*N) ;
    C = [C zeros(1,M*N-length(C))] ;
else ;
    C = C(1:M*N) ;
end
    
C = reshape(C,M,N)
