%% E7 - HW 4: Functions - Carlin Liao

%% Problem 1 - Time Conversion
% Include a call to your function in this code cell
% Test your function with many different input values
TotalMinutes = 61;

[Hours Minutes Message] = MyTimeConversion(TotalMinutes)


%% Problem 2 - Convert
% Include a call to your function in this code cell
% Test your function with many different input values
message = 'UC Berkeley is everything I hoped for.';
secretKey = 'abc';
ctext = Convert(message,secretKey,'encrypt')
Convert(ctext, secretKey, 'decrypt')


%% Problem 3 - Finding Patterns
% Include a calls to your functions in this code cell
% Test your function with many different input values
V = [1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0];

flipNth(V,22)
flipNthVal(V,3,1)
[count, indices] = findWithOverlap(V,[1 1])


%% Problem 4 - Pad, Unpad, and Polynomial Addition
% Include a calls to your functions in this code cell
% Test your function with many different input values
v = [1 0 3 4 5];
w = [0 0 0 0 1 2 3 0 4];

result9a1 = padrv(v,2)
result9a2 = padrv(v,9)
result9b = unpad(w)

p1 = [1 0 3];
p2 = [-1 2 1];
p3 = [1 1 0 3];
p4 = [-1 2 1];

polyadd(p1,p2)
polyadd(p3,p4)


%% Problem 5 - Numerical Differentiation
% Include a call to your function in this code cell
% Test your function with many different input values
f = @(x) cos(x.^2);
df = @(x) -2*x.*sin(x.^2);
h = 0.1;

[df1est, df2est] = derivFCN(f, h);

x = linspace(0,pi,100);
plot(x, df(x), x, df1est(x), x, df2est(x))
legend('Exact Derivative', 'd1 Estimate', 'd2 Estimate')


%% Problem 6 - Function Average and Standard Deviation
% Include a call to your function in this code cell
% Test your function with many different input values
fh = @(z) cos(z)*sin(z);
L = 0;
R = 3;
N = 50;

[mean, sd, eV] = getStats(fh,L,R,N)


%% Problem 7
% Include calls to your function in this code cell
% Test your function with many different input values
u1 = 1;
u2 = 3;

a = 1;
b = 0.75;
c = 0.5;
d = 1.25;

A = 1.5;
B = 1;
D =0.5;

[dH1, dE1, dH2, dE2] = oneround(u1,u2,a,b,c,d,A,B,D)


