/*------------------------------*/
/* Graph representation 	*/
/* Directed Acyclic Graph, DAG 	*/
/* Directed Cyclic Graph, DAG 	*/
/*------------------------------*/
:- dynamic(restpath/1).

link(a,b).
link(b,c).
link(b,d).
link(c,e).
link(e,f).
link(d,f).

link(f,a).


/*------------------------------*/
/* connected(X,Y) finds out if 	*/
/* there is path from X to Y 	*/
/*------------------------------*/
connected(X,Y) :- link(X,Y).
connected(X,Z) :- link(X,Y), connected(Y,Z).

/*------------------------------*/
/* path(X,Y,Path) finds out the */
/* list Path from X to Y 	*/
/*------------------------------*/
path(X,Y, [X,Y]) :- link(X,Y).
path(X,Z, [X|Rest]) :- link(X,Y), path(Y,Z,Rest).

/*------------------------------*/
/* maxdepthpath(X,Y,C,Max,Path) */
/* finds out the list Path from */
/* X to Y, 			*/
/* C = Current, 		*/
/* Max = Maximum value		*/
/*------------------------------*/
maxdepth_path(X,Y,C,Max,[X,Y]) :- C<Max, link(X,Y).

maxdepth_path(_,_,Max,Max,[]).

maxdepth_path(X,Z,C,Max,[X|Rest]) :- 
	C<Max, link(X,Y), NewC is C+1, 
	maxdepth_path(Y,Z,NewC,Max,Rest).

/*------------------------------*/
/* printlist(List)		*/
/*------------------------------*/
printlist([]) :- nl.
printlist([X|Xs]) :- write(X),write(' '),printlist(Xs).

/*----------------------------------------------*/
/* printlist_count(List,C,Max)			*/
/* prints Max characters per line		*/
/* e.g. 					*/
/* ?- printlist_count([a,b,c,d,e],1,3).		*/
/* a b c					*/
/* d e						*/
/*----------------------------------------------*/
print_nice(List,Max) :- 
	printlist_count(List,1,Max).

printlist_count([],_,_) :- nl,!.
printlist_count([X|Xs],C,Max) :- 
	C=<Max,write(X),write(' '), NewC is C+1,
	printlist_count(Xs,NewC,Max),!.
printlist_count(List,C,Max) :- 
	C>Max,nl,
	printlist_count(List,1,Max),!.

/* Map */
% m = metro
% s = street
% p = pavement
% c = car
% d = diavasi

map_XY([
%   X    1 2 3 4 5 6 7 8 9 10 Y
	[p,p,p,p,p,p,s,s,s,p], % 1
	[s,s,c,c,d,s,s,s,s,p], % 2
	[s,s,s,s,d,s,s,s,s,p], % 3
	[s,s,s,s,d,s,s,s,s,p], % 4
	[p,p,p,p,p,p,s,s,s,p], % 5
	[p,p,p,m,p,p,d,d,d,p], % 6
	[p,p,p,p,p,p,c,s,s,p], % 7
	[p,p,p,p,p,p,c,s,s,p], % 8
	[p,p,p,p,p,p,s,s,s,p], % 9
	[p,p,p,p,p,p,s,s,s,p]  % 10
	]).

nice_map :- 
	map_XY(Map), print_map(Map).

print_map([]) :- nl,!.
print_map([Line|Xs]) :- 
	length(Line,N), 
	print_nice(Line,N), 
	print_map(Xs),!.

/* Author Kostas Ziovas */
print_m([]) :- nl,!.
print_m([[]|Rest]) :- nl,print_m(Rest).
print_m([[X|Xs]|Rest]) :- 
	write(X),write(' '),
	print_m([Xs|Rest]).
