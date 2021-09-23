/*Directed Acyclic and Cyclic Graph*/
link(a,b).
link(b,c).
link(b,d).
link(c,e).
link(e,f).
link(d,f).
link(f,a). 

/* connected(X,Y)  finds out if X,Y are connected */
connected(X,Y) :- link(X,Y).
connected(X,Z) :- link(X,Y), connected(Y,Z).


/* path(X,Y,Path) finds out the list Path from X to Y*/
path(X,Y,[X,Y]) :- link(X,Y).
path(X,Z,[X|Rest]) :- link(X,Y), path(Y,Z,Rest).

/*maxdepthpath(X,Y,C,Max,Path)*/
/* finds out the list Path from */
/* X to Y*/
/* C = current */
/* Max= Maximum value */

maxdepthpath(X,Y,C,Max,[X,Y]) :- C<Max, link(X,Y),X\=Y, write(' !Target found!').
maxdepthpath(X,Y,C,Max,[]):- X\=Y,C=Max,write(' !Maximum counter reached, before finding target! ').
maxdepthpath(X,Z,C,Max,[X|Rest]):- C<Max, link(X,Y), NewC is C+1,maxdepthpath(Y,Z,NewC,Max,Rest).


/*printlist(List)*/
printlist([],C,Max) :- nl,,write('End of list'),!.
printlist([X|Xs],C,Max) :- C=:=Max+1,nl,write('Counter reached goal'),!.
printlist([X|Xs],C,Max) :- C=<Max,write(X), write(' '),NewC is C+1, printlist(Xs,NewC,Max),!.


