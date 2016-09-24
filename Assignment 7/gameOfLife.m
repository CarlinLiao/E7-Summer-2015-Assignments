function finalArray = gameOfLife(initArray, num)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[rows cols] = size(initArray);
finalArray = initArray;

for i = 1:rows
    for j = 1:cols
        
        % up index
        if i == 1;
            up = rows;
        else
            up = i-1;
        end
        
        % down index
        if i == rows
            dn = 1;
        else
            dn = i+1;
        end
        
        % left index
        if j == 1
            lf = cols;
        else
            lf = j-1;
        end
        
        % right index
        if j == cols
            rh = 1;
        else
            rh = j+1;
        end
        
        %clockwise from top left
        neighbors = initArray(up,lf)+initArray(up,j)+initArray(up,rh)+...
            initArray(i,rh)+initArray(dn,rh)+initArray(dn,j)+...
            initArray(dn,lf)+initArray(i,lf);
        
        % only tracks when live/dead status changes, since init = final
        if neighbors == 3
            finalArray(i,j) = 1;
        elseif neighbors == 0 || neighbors == 1 || neighbors >= 4
            finalArray(i,j) = 0;
        end
    end
end

if num > 1
    finalArray = gameOfLife(finalArray,num-1);
end


end

