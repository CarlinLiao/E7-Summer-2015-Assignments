function aHanNew = magnifyingGlass(aHan, subdomain, insetPosition)
%UNTITLED2 Summary of this function goes here
%   get set axes

aHanNew = axes('Position',insetPosition);
lines = get(aHan,'Children');
for i = 1:numel(lines)
    plot(get(lines(i),'XData'),get(lines(i),'YData'),...
        'Color', get(lines(i),'Color'),...
        'LineWidth',get(lines(i),'LineWidth'));
    hold on
end
set(aHanNew,'XLim',subdomain,'XTick',...
    linspace(round(subdomain(1),2),round(subdomain(2),2),3));

end

