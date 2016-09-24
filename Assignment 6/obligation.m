classdef obligation
   properties
      % 3 properties, with really basic default values.  Nothing to code.
      StartTime = qualifiedTime   % this represents the start-time of obligation
      Duration = 0         % duration, in minutes, of obligation
      Description = ''     % 1-row (or empty) char array of description
   end
   
   methods
      % Don't bother making a constructor for this method.  Look at
      % the first few videos for the employee and employeeA classes.  They
      % both had a properties block (of course), but no constructor.  You
      % had to always start by creating default instances, and then set the
      % property values you wanted with (.) notation.  employeeA added the
      % set.Property methods, so that control was exerted over what the
      % values could be set to.  We'll follow that same logic here, and
      % allow you to focus on the set.Property methods, as well as the
      % methods that help the user understand their appointment list (nothing
      % more than an array of OBLIGATION objects).

      function B = set.StartTime(B,StartTimeValue)
         % Both B and StartTimeValue should be scalar.  StartTimeValue is
         % valid if it is of class qualifiedTime
         if strcmp(class(StartTimeValue), 'qualifiedTime')
             B.StartTime = StartTimeValue;
         else
             error('Input needs to be of class qualifiedTime');
         end
      end
      
      function B = set.Duration(B,DurationValue)
         % Both B and DurationValue should be scalar.  DurationValue is
         % valid if it is scalar, integer, >= 0
         if isscalar(DurationValue) && rem(DurationValue,1)==0 && DurationValue>=0
             B.Duration = DurationValue;
         else
             error('Input must be a scalar, nonnegative integer');
         end
      end
      
      function B = set.Description(B,DescriptionValue)
         % B should be a scalar.
         % DescriptionValue is valid if it is CHAR array, with 1-row or empty
         a = size(DescriptionValue);
         if ischar(DescriptionValue) && a(1) == 1||0
             B.Description = DescriptionValue;
         else
             error('Input must be a string');
         end
      end
      
      function BIP = inprogress(B,NOW)
         % B is array (all testing will be performed with only row or
         % column vectors) of OBLIGATION objects; NOW is a scalar qualifiedTime.
         % The output argument, BIP, should be an array (drawn from B) of
         % those obligations which are "in progress" at the date/time
         % specified by the scalar NOW. (approximately 5 lines, plus END statement)
         BIP = [];
         for i = 1:numel(B)
             if B(i).StartTime <= NOW && B(i).StartTime+B(i).Duration >= NOW
                 BIP = [BIP B(i)];
             end
         end
      end
      
      function Bkeep = discard(B,TS)
         % B is array (all testing will be performed with only row or
         % column vectors) of OBLIGATION objects; TS is a scalar qualifiedTime.
         % The output argument, BKEEP, should be an array (drawn from B) of
         % those obligations which are not-yet started, or still "in progress"
         % at the date/time specified by the scalar TS.  In other words,
         % this method "discards" all obligations with "stop"-times before
         % the given TS.  (approximately 5 lines, plus END statement)
         Bkeep = [];
         for i = 1:numel(B)
             if B(i).StartTime+B(i).Duration >= TS
                 Bkeep = [Bkeep B(i)];
             end
         end
      end
      
      function Bkeep = completedby(B,TS)
         % B is array (all testing will be performed with only row or
         % column vectors) of OBLIGATION objects; TS is a scalar qualifiedTime.
         % The output argument, BKEEP, should be an array (drawn from B) of
         % those obligations which are completed before/by the date/time
         % specified by the scalar TS. (approximately 5 lines, plus END statement)
         Bkeep = [];
         for i = 1:numel(B)
             if B(i).StartTime+B(i).Duration <= TS
                 Bkeep = [Bkeep B(i)];
             end
         end
      end
      
      
      function [Bs,idx] = sortByStart(B)
         % Assume B is a row or column, and sort by the start-time of each
         % obligation, earliest first.  Remember that there is a MINUS
         % method for qualifiedTime objects, so you can get a relevant vector
         % of integers by building a vector whose i'th element is the
         % difference (ie., MINUS) of the StartTime
         % property-value of the i'th element of B, and some fixed StartTime value
         % (the default value of StartTime objects will work).  sorting that
         % vector, with SORT, should get the Index vector you need to
         % rearrange B into a sorted order. (8 lines, with END statement)
         indices = 1:numel(B);
         diff = indices;
         for i = 1:numel(B)
             diff(i) = B(i).StartTime-qualifiedTime();
         end
         indices = [diff; indices]';
         indices = sortrows(indices);
         for i = 1:numel(B)
             Bs(i) = B(indices(numel(B)+1-i,2));
         end
      end
      
      function [Bs,idx] = sortByEnd(B)
         % Assume B is a row or column, and sort by the end-time of each
         % obligation, earliest first.  Remember that there is a MINUS
         % method for qualifiedTime objects, so you can get a relevant vector
         % of integers by building a vector whose i'th element is the
         % difference (ie., MINUS) of the StartTime
         % property-value of the i'th element of B, and some fixed qualifiedTime
         % value (the B(1).StartTime value will work for the fixed value).
         % Sorting that vector, using SORT, should get the Index vector you need to
         % rearrange B into a sorted order. (8 lines, with END statement)
         indices = 1:numel(B);
         diff = indices;
         for i = 1:numel(B)
             diff(i) = B(i).StartTime+B(i).Duration-qualifiedTime();
         end
         indices = [diff; indices]';
         indices = sortrows(indices);
         for i = 1:numel(B)
             Bs(i) = B(indices(numel(B)+1-i,2));
         end
      end
      
      function T = char(B)
         % This should work for arrays of B, simply vertically
         % concatenating all of the char arrays returned from SINGLECHAR
         % acting on each element of the array.  All code supplied here, so
         % you only need to focus on the SINGLECHAR method.
         T = '';
         for i=1:numel(B)
            T = char(T,singlechar(B(i)));
         end
      end
      
      function C = singlechar(B)
         % Creates a CHAR from a scalar (1-by-1) OBLIGATION object.
         % In general, the format
         % would be set by a design-team, but for autograding purposes, we
         % will stick to a specific format - see sample output to determine
         % what we're dictating as correct.  Note: This
         % method should DEFINITELY use the CHAR method from qualifiedTime
         % class.
         C = sprintf([B.Description '\n   Start: ' char(B.StartTime) ';   End: ' char(B.StartTime+B.Duration)]);
      end
      
      function display(B)
         % standard DISPLAY we have used so far, composing Matlab's DISP
         % with the CHAR method from the class.
         disp(char(B))
      end
      
   end
end
