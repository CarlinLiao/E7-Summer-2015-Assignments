function [engEnergy, brkEnergy] = trainEnergy(tstep, intBrakePow, intEnginePow)
% Assumes intBrakePow and intEnginePow do not include value at 0
% Takes instantaneous brake and engine power arrays and the time interval
% between each entry and calculates the instantaneous engine and brake 
% energy at the same intervals

x = (1:numel(intBrakePow))*tstep;
% note that it follows the input and does not automatically start at 0
engEnergy = trapz(x,intEnginePow);
brkEnergy = trapz(x,intBrakePow);


end

