
/*Metro*/
%m = metro
%s =street
%p =pavement
%c =car
%d =diavasi

mapXY([
% X     1 2 3 4 5 6      y
       [p,p,p,p,p,p], %1
	   [s,s,c,c,d,s], %2
	   [s,s,s,s,d,s], %3
	   [s,s,s,s,d,s], %4
	   [p,p,p,m,p,p]  %5
	   ]).

printmap([]):- nl,write('End of Script'),!.
printmap([[]|Rest]) :- nl,printmap(Rest),!.
printmap([[X|Xs]|Rest]):- write(X),write(' '),printmap([Xs|Rest]).