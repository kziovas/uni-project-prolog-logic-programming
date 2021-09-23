/*--------------------------------------*/
/* Map double list representation 	*/
/*--------------------------------------*/



/*-------------- Map ------------------*/
% m = metro
% s = street
% p = pavement
% c = car
% d = diavasi
/*
mymap([
%   X    1 2 3 4 5 6     Y
	[p,p,p,p,p,p], % 1
	[s,s,c,c,d,s], % 2
	[s,s,s,s,d,s], % 3
	[s,s,s,s,d,s], % 4
	[p,p,p,m,p,p]  % 5
	]).
*/

mymap([
%   X    1 2 3 4 5 6     Y
	[0,0,0,w,0,0], % 1
	[0,0,0,0,0,0], % 2
	[0,0,0,w,0,w], % 3
	[w,0,0,0,0,0], % 4
	[w,w,0,w,0,0], % 5
	[w,w,0,w,0,0], % 6
	[w,w,0,w,0,0], % 7
	[w,w,0,w,0,0]  % 8 
	]).

/*---------- PathFinder --------*/

/*--------------------------------------*/
/* findpath(Start,Finish,Path)		*/
/*--------------------------------------*/
/* ?- findpath((1,1), (5,5), Path). 	*/
/* Path=[(1,1),(1,2),...,(5,5)]		*/
/*--------------------------------------*/
findpath(F,F,[F]).
findpath(Start,Finish,[Start|Rest]) :-
	nextmove(Start,Next),
	valid(Next),
	findpath(Next, Finish, Rest).

/*----------------------------------------------*/
/* path_no_circle(Start,Finish,Visited,Path)	*/
/*----------------------------------------------*/
/* ?- path_no_circle((1,1), (5,5), Path). 	*/
/* Path=[(1,1),(1,2),...,(5,5)]			*/
/*----------------------------------------------*/
path_no_circle(F,F,_,[F]).
path_no_circle(Start,Finish,Visited,[Start|Rest]) :-
 nextmove(Start,Next),
 valid(Next),
 not(member(Next,Visited)),
 path_no_circle(Next,Finish,[Next|Visited],Rest).
 

nextmove((X,Y),(NX,NY)) :- NX is X,	NY is Y+1.	% move South
nextmove((X,Y),(NX,NY)) :- NX is X-1,	NY is Y+1.	% move SouthWest

nextmove((X,Y),(NX,NY)) :- NX is X,	NY is Y-1.	% move North
nextmove((X,Y),(NX,NY)) :- NX is X+1,	NY is Y-1.	% move NorthEast
nextmove((X,Y),(NX,NY)) :- NX is X+1,	NY is Y. 	% move East
nextmove((X,Y),(NX,NY)) :- NX is X+1,	NY is Y+1.	% move EastSouth

nextmove((X,Y),(NX,NY)) :- NX is X-1,	NY is Y.	% move West
nextmove((X,Y),(NX,NY)) :- NX is X-1,	NY is Y-1.	% move WestNorth

valid( (X,Y) ) :- 
	mymap(M), mapmax(M, MaxX,MaxY),
	0<X, X=<MaxX, 0<Y, Y=<MaxY, 	% robot in map
	map_element(M,X,Y,E), E\='w'.	% E is not Wall



/*----------------- Library ------------*/

/*---- Map Library ---------------------*/
mapmax(M, MaxX, MaxY) :-
	M=[M1|Ms],
	length(M1,MaxX),
	length(M,MaxY).

/*----------------------------------------------------------------------*/
/* map_element(M,X,Y,E) : Input Map M, coordinates X,Y, Output E, 		*/
/* which is the content of Map at position X,Y							*/
/*----------------------------------------------------------------------*/
map_element(M,X,Y,E):- 
	list_element(M,Y,Line),
	list_element(Line,X,E).

/*----------------------------------------------------------------------*/
/* list_element(L,X,E) : Input List L, coordinate X, Output E, 			*/
/* which is the content of List at position X,							*/
/*----------------------------------------------------------------------*/
list_element([A|As],1,A).
list_element([A|As],N,E) :- 
	N1 is N-1, list_element(As,N1,E),!.

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
	C=<Max,write(X),write('   '), NewC is C+1,
	printlist_count(Xs,NewC,Max),!.
printlist_count(List,C,Max) :- 
	C>Max,nl,
	printlist_count(List,1,Max),!.


nice_map :- 
	mymap(Map), print_map(Map,1,5).

print_map([],_,_) :- nl,!.
print_map([Line|Xs],C,Max) :- 
	C=<Max, print_nice(Line,6), NewC is C+1,
	print_map(Xs,NewC,Max),!.
print_map(List,C,Max) :- 
	C>Max,nl,
	print_map(List,1,Max),!.

/*
link((1,1),(2,1)).
link((1,1),(2,2)).
link((1,1),(1,2)).
*/