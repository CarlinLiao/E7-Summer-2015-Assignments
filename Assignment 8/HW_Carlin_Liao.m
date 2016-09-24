%% E7 - Assignment 8 - Carlin Liao

%% 1. Binary search

A = sort(randn(1,10));
V = A([1:6 7 7 7 7 7 7 8:10]); % element 7-12 are the same
I = bsearchRepeats(V,A(7));
isequal(I,[7 12]) % should be TRUE (and is true! :D )

%% 2. Simpson's rule

% see intEst();

%% 3. cumtrapz

load smartRocketData
size(time);
size(accel);
InitAlt = 100;
[VV,Alt] = astronautAndroid(time,accel,InitAlt);
plot(time,VV)
title('Rocket Vertical Velocity');
ylabel('velocity (m/s)');
xlabel('time (s)');
grid on;
pause(3)
plot(time,Alt)
title('Rocket Altitude');
ylabel('altitude (m)');
xlabel('time (s)');
grid minor;

%% 4. myDerivative

r = 5;
f = @(x) sin(r*x).*exp(-x);
dfdx = @(x) (r*cos(r*x)-sin(r*x)).*exp(-x);
df2dx2 = @(x) (-2*r*cos(r*x)-(r*r-1)*sin(r*x)).*exp(-x);
h = 0.3;
x = 0:h:3;
y = f(x);
[d1,d2] = myDerivative(h,y);
subplot(2,1,1);
plot(x,dfdx(x),'r*',x,d1,'ko');
legend('Exact derivative','Estimated Derivative');
max(abs(dfdx(x)-d1))
subplot(2,1,2);
plot(x,df2dx2(x),'r*',x,d2,'ko');
max(abs(df2dx2(x)-d2))


%% 5. trains

clf
load('trainData.mat');
[brakePow, engPow] = trainPower(X,Y,4,7*10^6,8*10^3);
% inputs' units are m, m, s, kg, N/(m/s)
[engEngy, brkEngy] = trainEnergy(4,brakePow,engPow); % s, w, w


%% 6. ODE

% see odeSolver. Sample problems were not included in Assignment #8 pdf.
