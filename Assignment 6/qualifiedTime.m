classdef qualifiedTime
   properties
      % Default property values (midnight, Jan 1, 1).  This is fine, and
      % there is nothing to add to this block.
      Time = timeofday(0,0)
      Date = dateE7(1,1,yearE7(1))
   end
   
   methods
      function E = qualifiedTime(T,D,a1,a2,a3)
         % *** As in TIMEOFDAY, completing this method is the last step.
         % The empty constructor method can create default instances, and
         % their property values modified using (.) notation (like STRUCT),
         % which calls the set.Property methods.***
         % if NARGIN==0, do nothing, so that default instance is returned
         % if NARGIN==1, and input arg is qualifiedTime object, pass it back,
         % unchanged.
         % if NARGIN==2, arguments are (timeofday,dateE7).
         % If the set.Time and set.Date methods are
         % properly implemented, they will be called, and they will do all
         % of the error-checking, so no need to check validity here.
         % if NARGIN==5, interpret the integer arguments as
         % (hour,minute,day,month,year), call timeofday, yearE7 and dateE7
         % to create the qualifiedTime object.   No need to do error-checking,
         % as invalid input arguments will be caught elsewhere (error
         % message may be a bit obscure, but we won't worry about that).
         % NARGIN==3, or 4 should cause ERROR.
         if nargin==2
             E.Time = T;
             E.Date = D;
         elseif nargin==5
             E.Time = timeofday(T,D);
             E.Date = dateE7(a1,a2,a3);
         elseif nargin==1 && isa(T,'qualifiedTime')
         elseif nargin>0
             error('qualifiedTime only takes 1, 2, and 5 inputs');
         end
      end
      
      function E = set.Time(E,TimeValue)
         % TimeValue is valid if it is of class timeofday. ERROR for
         % invalid TimeValue.
         if isa(TimeValue, 'timeofday')
             E.Time = TimeValue;
         else
             error('Input should be a timeofday object')
         end
      end
      
      function E = set.Date(E,DateValue)
         % DateValue is valid if it is of class dateE7.  ERROR for
         % invalid DateValue.
         if isa(DateValue, 'dateE7')
             E.Date = DateValue;
         else
             error('Input should be a dateE7 object')
         end
      end
      
      function TpN = plus(T,N)
         % Given a qualifiedTime T, and integer nonnegative integer N,
         % determine the qualifiedTime representing N-minutes-after-T.
         % Look at test-script for other examples.
         % Use public method nRollOvers from timeofday
         if N>0 && rem(N,1)==0
             TpN = qualifiedTime(T.Time + N, T.Date + nRollOvers(T.Time,N));
         else
             error('Second input should be an nonnegative integer');
         end
      end
      
      function N = minus(E1,E2)
         % Given a qualifiedTime E1, and qualifiedTime E2, determine the
         % integer N such that E2 + N equals E1.
         % Likely uses MINUS method for dateE7, and t2mam for timeofday
         N = 1440*(E2.Date-E1.Date)-t2mam(E1.Time)+t2mam(E2.Time);
      end
      
      function F = le(A,B)
         % operator-overload for A<=B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = false;
         if A.Date < B.Date
             F = true;
         elseif A.Date == B.Date && A.Time <= B.Time
             F = true;
         end
      end
      function F = lt(A,B)
         % operator-overload for A<B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = false;
         if A.Date < B.Date
             F = true;
         elseif A.Date == B.Date && A.Time < B.Time
             F = true;
         end
      end
      function F = ge(A,B)
         % operator-overload for A>=B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = false;
         if A.Date > B.Date
             F = true;
         elseif A.Date == B.Date && A.Time >= B.Time
             F = true;
         end
      end
      function F = gt(A,B)
         % operator-overload for A>B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = false;
         if A.Date > B.Date
             F = true;
         elseif A.Date == B.Date && A.Time > B.Time
             F = true;
         end
      end
      function F = eq(A,B)
         % operator-overload for A==B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = false;
         if A.Date == B.Date && A.Time == B.Time
             F = true;
         end
      end
      function F = ne(A,B)
         % operator-overload for A~=B.  Based code on existence of all
         % required relational operators in dateE7 and timeofday classes.
         F = true;
         if A.Date == B.Date && A.Time == B.Time
             F = false;
         end
      end
      
      function C = char(E)
         % In general, the format would be set by a design-team, but for
         % autograding purposes, we will stick to a specific format - see
         % sample output to determine what we're dictating as correct.
         % Note: This method should definitely use the CHAR method from
         % both the dateE7 and timeofday classes.
         C = [char(E.Date) ', ' char(E.Time)];
      end
      
      function display(E)
         % standard DISPLAY we have used so far, composing Matlab's DISP
         % with the CHAR method from the class.
         disp(char(E));
      end
   end
end