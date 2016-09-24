function strOut = Convert(strIn,key,mode)
% Encrypt or decrypt a message using a given key.
% If key is longer than strIn, this code will not work.

switch nargin
    case 2
        mode = 'decrypt';
    case 3
    otherwise
        error('Convert needs at least an input string and a key to run.')
end  

if length(key) > length(strIn)
    error('Key must be equal length or shorter than input string.')
end

keyL = key;
strOut = strIn;
while numel(keyL) < numel(strIn)
    keyL = [keyL key];
end
keyL = keyL(1:length(strIn));
    
if strcmp(mode,'encrypt')
    for i = 1:numel(strIn)
        strOut(i) = char(double(strIn(i))+double(keyL(i))+mod(i,10));
    end
elseif strcmp(mode,'decrypt')
    for i = 1:numel(strIn)
        strOut(i) = char(double(strIn(i))-double(keyL(i))-mod(i,10));
    end
else
    error('Convert needs at least an input string and a key to run.')
end

end

