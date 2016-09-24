function [intBrakePow, intEnginePow] = trainPower(x, y, tstep, mass, friction)
% takes x and y data, time interval tstep between each xy coordinate, and
% mass and friction of the train to outpute instantaneous brake and engine
% power at every tstep

% distance dist traveled between tsteps
% cumulative distance traveled s
dist = 0;
s = 0;
for i = 2:numel(x)
    dist(i) = sqrt((x(i)-x(i-1))^2+(y(i)-y(i-1))^2);
    s(i) = s(i-1) + dist(i);
end

% velocity v and acceleration a and force F and power P, all instantaneous
[v, a] = myDerivative(tstep,s);
F = mass.*a + friction.*v;
P = F.*v;


% rah rah find the powah
intBrakePow = zeros(size(F));
intEnginePow = intBrakePow;
for i = 1:numel(a)
    if F(i) > 0
        intBrakePow(i) = 0;
        intEnginePow(i) = P(i);
    elseif F(i) < 0
        intBrakePow(i) = -P(i);
        intEnginePow(i) = 0;
    else
        intBrakePow(i) = 0;
        intEnginePow(i) = 0;
    end
end


plot(s,v); % velocity
ylabel('velocity (m/s)');
xlabel('position (m)');
grid minor
pause(2);

plot(s,a); % accel
ylabel('acceleration (m/s^2)');
xlabel('position (m)');
grid minor
pause(2);

plot(0:4:852,intBrakePow,'r-.');
hold on;
plot(0:4:852,intEnginePow,'b-.');
grid minor
legend('Brakes','Throttle');
xlabel('Time(s)');
ylabel('Power (Watts)');


end

