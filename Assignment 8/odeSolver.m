function [tPoints, Y] = odeSolver(fHan, tSpan, initCond)
% calls ode45, with modifications depending on tSpan input size
% 2 entries calls linspace, more than 2 inserts it directly

if numel(tSpan) == 2
    % contents of tSpan are the starting and ending times
    [tPoints,Y] = ode45(fHan,linspace(tSpan(1),tSpan(2)),initCond);
elseif numel(tSpan) > 2
    % return the computed solution estimate at the points corresponding to the elements of tSpan.
    [tPoints,Y] = ode45(fHan,tSpan,initCond);
else
    error('tSpan must have either two or more than two values');
end


end

