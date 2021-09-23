




/*-----------------------*/
/* mymember(X,List)      */
/*-? mymember(X,[a,b,c]) */
/* X=a;                  */
/* X=b...                */
/*-----------------------*/

mymember(X,[X|_]).
mymember(X,[_|Rest]) :-  mymember(X,Rest).


