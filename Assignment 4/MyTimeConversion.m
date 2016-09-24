function [Hours, Minutes, Message] = MyTimeConversion ( TotalMinutes )
% input:  nonnegative scalar integer representing the total number of minutes in a specified time interval.
% output: Hours and Minutes, and a message including said hours and min

Hours = floor(TotalMinutes/60);
Minutes = mod(TotalMinutes, 60);

TotSay = [num2str(TotalMinutes) ' minutes are equal to ']; 
if TotalMinutes == 1
    TotSay = [num2str(TotalMinutes) ' minute is '];
end

HrSay = [num2str(Hours) ' hour']; 
if Hours ~= 1
    HrSay = [HrSay 's'];
end

MinSay = [num2str(Minutes) ' minute']; 
if Minutes ~= 1
    MinSay = [MinSay 's'];
end

Message = [TotSay HrSay ' and ' MinSay '.'];

end

