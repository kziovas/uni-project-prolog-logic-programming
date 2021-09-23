
/* ---------------------------------------------------- */
/* This is a library with functions that we made before */
/* ---------------------------------------------------- */

/* Calculates the sum of the elements of a list */
sumlist([],Sum):- Sum is 0.
sumlist([X|Rest],Sum):- sumlist(Rest,S),Sum is S+X.

/* Calculates the product of the elements of a list */
multlist([],Mult):- Mult is 1.
multlist([X|Rest],Mult):- multlist(Rest,M),Mult is M*X.

/* Calculates the length of a list */
listlength([],L):- L is 0.
listlength([_|Rest],L):- listlength(Rest,Length), L is Length +1.

/* Calculates the first element of a list */
first_element([X|_],X).

/* Calculates the last element of a list */
last_element([X],Last):- Last is X.
last_element([_|Rest],Last):- last_element(Rest,Last).

/* Returns the n-th element of a list */
nth_element([E|_],1,E).
nth_element([_|Rest],N,E):-  N >1 , N2 is (N-1), nth_element(Rest,N2,E).

/* Returns the position of element E in a list */
element_position([E|_], N, E) :- N is 1.
element_position([_|Rest],N, E) :- element_position(Rest,N2, E), N is (N2+1).

/* Returns true if X is an element of a list */
my_member(X,[X|_]).
my_member(X,[_|Rest]):- my_member(X,Rest).


/* If X is the element of a list it returns the rest of the list without X */
my_select(X,[X|Xs],Rest):- Rest = Xs.
my_select(X,[Y|Xs],Rest) :- my_select(X,Xs,R), append([Y],R,Rest). /* Xreiazontai aggiles girw apo to Y gia an to diavasei san lista!!! gamw to kerato tou mish wra */

/* This is my version of append function. It doesnt work if R=[X|Temp] is at the end for some reason */
my_append([],L2,L2).
my_append([X|Rest],L2,R):- R=[X|Temp],my_append(Rest,L2,Temp).

/* This is the standard way to do append */
my_append2([],L,L).
my_append2([X|Xs],Y,[X|Zs]):- my_append2(Xs,Y,Zs).

%xymapelement(Map,X,Y,E). to E einai to periexomeno tou Map sti thesi (x,y)
xymapelement(Map,X,Y,E):-map1(Map), nth_element(Map,Y,L),nth_element(L,X,E).

%mapelementposition(Map,E,X,Y) vriskei tis syntetagmenes X,Y toy E sto map
mapelementposition(Map,E,X,Y):- map1(Map), element_position(Map,Y,L), element_position(L,X,E).

%printlist(List) typwnei orizontia ta stoixeia tis listas List
printlist([]):-nl.
printlist([X|Xs]):- write(X), write(" "), printlist(Xs).

%printmap(Map)  typwnei omoiomorfa to xarti Map
printmap([]):-nl.
printmap([Line|Lines]):- printlist(Line), printmap(Lines).

%map_maxXY(Map,MaxX,MaxY) epistrefei ta maxX kai MaxY toy xarti map
map_maxXY([],0,0).
map_maxXY([Line|Lines],MaxX,MaxY):- listlength([Line|Lines],MaxY), listlength(Line,MaxX).


/* ----------------------------------------------------------- */
/* This is another map. To call it from prolog we need         */
/* to type map1(X) where X is assigned the contents of the map */
/* ----------------------------------------------------------- */


map1([
% X 1 2 3 4 5 6 7 8    Y
   [0,0,1,1,0,0,0,0], %1
   [1,0,0,1,1,0,0,0], %2
   [1,1,0,1,1,1,0,1], %3
   [0,1,1,0,1,0,0,1], %4
   [0,0,0,0,0,1,0,1], %5
   [1,0,1,0,0,0,0,1]  %6
]).
start( (1,1) ).
finish( (5,1) ). 

/*-------------------------------------- */
/* This are the arguments needed for     */
/* the depth first searching algorithm   */
/* ------------------------------------- */
% path_from_to(Path)
pathfinder(S,F,P) :-
 map1(M),
 findpath(M,S,F,[S],P).
 
path_from_to(P) :-
 start(S), finish(F), map1(M),
 findpath(M,S,F,[S],P).
 
findpath(M,F,F,_,[F]).
findpath(M,S,F,Visited,[S|P]) :-
 move(S,Next),
 not(member(Next,Visited)),
 valid(M,Next),
 findpath(M,Next,F,[Next|Visited],P). 

move((X,Y),(NX,NY)) :- NX is X,	NY is Y+1.	% move South
%move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y+1.	% move SouthWest

move((X,Y),(NX,NY)) :- NX is X,	NY is Y-1.	% move North
%move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y-1.	% move NorthEast
move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y. 	% move East
%move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y+1.	% move EastSouth

move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y.	% move West
%move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y-1.	% move WestNorth

valid(M, (X,Y) ) :- 
	map1(M), map_maxXY(M, MaxX,MaxY),
	0<X, X=<MaxX, 0<Y, Y=<MaxY, 	
	xymapelement(M,X,Y,E), E=0.	% E is not Wall




