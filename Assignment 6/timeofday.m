classdef timeofday
   properties (SetAccess = public)
      % Default property values (midnight).  This is fine, and there is
      % nothing to add to this block.
      H = 0;
      M = 0;
   end
   
   methods
      function T = timeofday(H,M)
         % *** Completing the rest of this constructor is the last step (see
         % todscript.m).   With an empty constructor method, you can create
         % default instances, and modify their property values using (.)
         % notation (like STRUCT), which calls the set.Property methods.***
         %  if NARGIN==0, do nothing, so that default instance is returned
         %  if NARGIN==1, and input arg is timeofday object, pass it back,
         %    unchanged (already done, see below).
         %  if NARGIN==2, use the arguments as values for the H and M
         %    property, respectively.  If the set.H and set.M methods are
         %    properly implemented, they will be called, and they will do
         %    all of the error-checking, so no need to check validity here.
         if nargin==0             
         elseif nargin==1
            if isa(H,'timeofday')
               % If there is only one input argument, and it is a TIMEOFDAY
               % object, pass it back, unchanged.  This is a requirement of
               % all constructors.
               T = H;
            else
               error('Invalid single argument call to TIMEOFDAY');
            end
         elseif nargin==2
            T.H = H;
            T.M = M;
         end
      end
      
      function T = set.H(T,HValue)
         % Use the static method isValidH to check the validity of HValue
         % before changing the value of T.H.   Use ERROR if HValue is invalid. 
         if timeofday.isValidH(HValue)
             T.H = HValue;
         else
             error([class(HValue) num2str(HValue) ' is an invalid hour value']);
         end
      end
      
      function T = set.M(T,MValue)
         % Use the static method isValidM to check the validity of MValue
         % before changing the value of T.M.   Use ERROR if MValue is invalid. 
         if timeofday.isValidM(MValue)
             T.M = MValue;
         else
             error('Invalid minute value');
         end
      end
        
      function C = char(T)
         % Use the static method HMconvert to create the CHAR representation.
         % Remember that single-digit values (eg., 5) of H and M should be
         % expressed with leading '0' characters in C.
         C = [timeofday.HMconvert(T.H) ':' timeofday.HMconvert(T.M)];         
      end
      
      function display(T)
         % standard DISPLAY we have used so far, composing Matlab's DISP
         % with the CHAR method from the class.  You can add the CHAR
         % 'TOD: ' to the beginning, if you like.  DISPLAY should not be
         % called by any of the methods - Matlab will call it automatically
         % when a semicolon is omitted from the RHS.  (one line, plus END)
         disp(['TOD: ' char(T)]);
      end
      
      function N = t2mam(T)
         % Convert a timeofday object into a integer, which characterizes
         % the time as "number of minutes after midnight".  The returned
         % integer should be in the range [0, 1439].  (one line of code...)
         N = T.H*60 + T.M;
      end
      
      function F = ge(T1,T2)
         % operator-overload for T1>=T2.  Likely use t2mam
         F = false;
         if t2mam(T1) >= t2mam(T2)
            F = true;
         end
      end
      
      function F = gt(T1,T2)
         % operator-overload for T1>T2.  Likely use t2mam
         F = false;
         if t2mam(T1) > t2mam(T2)
            F = true;
         end
      end
      
      function F = le(T1,T2)
         % operator-overload for T1<=T2.  Likely use t2mam
         F = false;
         if t2mam(T1) <= t2mam(T2)
            F = true;
         end
      end
      
      function F = lt(T1,T2)
         % operator-overload for T1<T2.  Likely use t2mam
         F = false;
         if t2mam(T1) < t2mam(T2)
            F = true;
         end
      end
      
      function F = eq(T1,T2)
         % operator-overload for T1==T2.  Likely use t2mam
         F = false;
         if t2mam(T1) == t2mam(T2)
            F = true;
         end
      end
      
      function F = ne(T1,T2)
         % operator-overload for T1~=T2.  Likely use t2mam
         F = false;
         if t2mam(T1) ~= t2mam(T2)
            F = true;
         end
      end
            
      function nco = nRollOvers(T,N)
         % Given a timeofday T, and integer nonnegative integer N,
         % determine how many occurances of midnight (00:00) occur between
         % 1-minute-after-T and N-minutes-after-T (inclusive).  For
         % example:  if k is a non-negative integer, then
         %        nRollOvers(T,k*1440)) equals k, regardless of T.  
         % Look at test-script for other examples.
         % Use t2mam, and an appropriate rounding method (round, ceil, floor).
         if rem(N,1)==0 && N >= 0
             nco = floor((t2mam(T) + N)/1440);
         else
             error('Second input must be a nonnegative integer');
         end
      end
      
      function T2 = plus(T,N)
         % Given a timeofday T, and integer nonnegative integer N,
         % determine the timeofday N-minutes-after-T.  For
         % example:  if k is a non-negative integer, then
         %        plus(T,k*1440)) equals T, regardless of T and k.  
         % Look at test-script for other examples.
         % Use t2mam and mam2t.
         if N > 0 && rem(N,1)==0
             n = rem(t2mam(T)+N,1440);
             T2 = timeofday(floor(n/60),rem(n,60));
         else
             error('Please input non-negative integer for second argument');
         end
      end
    
      end
    
   methods (Static = true)
      % These are the methods that do not have timeofday objects in their
      % input argument list, but they still are methods of the class.  They
      % must be declared as STATIC, and they must be called using the
      % syntax: timeofday.MethodName(ArgumentList).
      function [FM] = isValidM(M)
         % Return TRUE for valid values of M (numeric, integer, ranging
         % from 0 to 59 (inclusive).
         FM = false;
         if isnumeric(M) && rem(M,1)==0 && M<=59 && M>=0
             FM = true;
         end
      end
      
      function [FH] = isValidH(H)
         % Return TRUE for valid values of H (numeric, integer, ranging
         % from 0 to 23 (inclusive).
         FH = false;
         if isnumeric(H) && rem(H,1)==0 && H<=23 && H>=0
             FH = true;
         end
      end
      
      function S = HMconvert(A)
         % Convert integer to char, using INT2STR.  Pad single-digit
         % numbers (ie., 0-9) with a leading '0' character.
         S = int2str(A);
         if length(S) < 2
             S = ['0' S];
         end
      end
      
      function [T] = mam2t(N)
         % Convert a non-negative integer N, interpreted as
         % minutes-after-midnight, into a timeofday object.   Since this
         % code does not need to track "RollOvers",
         % mam2t(N) equals mam2t(N+k*1440) for any value of N and
         % non-negative integer k.
         T = timeofday();         
         if N > 0 && rem(N,1)==0
             if N > 1440
                 N = rem(N,1440);
             end
             H = floor(N/60);
             M = rem(N,60);
             T = timeofday(H,M);
         else
             error('Please input a non-negative integer value for minutes-after-midnight')
         end
      end      
   end
end
