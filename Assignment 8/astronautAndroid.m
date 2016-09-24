function [VV,Alt] = astronautAndroid(Tstamp,Accel,InitialAltitude)
% takes double vector of times Tstamp, acceleration data Accel at those
% Tstamps, and double InitialAltitute and spits out instantaneous vertical
% velocity and altitude at each Tstamp

intvl = Tstamp(1)-Tstamp(2);

VV = cumtrapz(Tstamp,Accel);
Alt = cumtrapz(Tstamp,VV)+InitialAltitude;


end

