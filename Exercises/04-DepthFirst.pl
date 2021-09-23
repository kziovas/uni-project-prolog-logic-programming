%     X: 1 2 3 4 5 6 7 8     Y
map1([
		[0,0,1,1,0,0,0,0],  %1
		[0,0,0,1,1,0,0,0],  %2
		[0,1,0,0,1,1,0,1],  %3
		[0,1,1,0,1,0,0,1],  %4
		[0,0,0,0,0,1,0,1],  %5
		[1,0,1,0,0,0,0,1]   %6
		]).
start( (1,1) ).
finish( (5,1) ).

%path_from_to(Path)

pathfinder(S,F,P):-
		map1(M),
		findpath(M,S,F,[S],P).
		
path_from_to(P):-
		start(S), finish(F), map1(M),
		findpath(M,S,F,[S],P).
		
findpath(_,F,F,_,[F]).
findpath(M,S,F,Visited,[S|P]):-
		move(S,Next),
		not(member(Next,Visited)),
		valid(M,Next),
		findpath(M,Next,F,[Next|Visited],P).

valid(M,(X,Y)):-
		map_maxXY(M,MaxX,MaxY),
		0<X, X=<MaxX, 0<Y, Y=<MaxY,
		xymapelement(M,X,Y,E), E = 0.
		
move((X,Y),(NX,NY)) :- NX is X,	NY is Y-1.	    % move North
move((X,Y),(NX,NY)) :- NX is X,	NY is Y+1.	    % move South
move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y. 	% move East
move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y.	% move West
%move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y-1.	% move NorthEast
%move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y-1.	% move NorthWest
%move((X,Y),(NX,NY)) :- NX is X+1,	NY is Y+1.	% move SouthEast
%move((X,Y),(NX,NY)) :- NX is X-1,	NY is Y+1.	% move SouthWest







/*=====================TEST LIBRARY=====================*/
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
	map1(Map), print_map(Map,1,7).

print_map([],_,_) :- nl,!.
print_map([Line|Xs],C,Max) :- 
	C=<Max, print_nice(Line,8),nl, NewC is C+1,
	print_map(Xs,NewC,Max),!.
print_map(List,C,Max) :- 
	C>Max,nl,
	print_map(List,1,Max),!.
/*=======================================================*/





/*========  HELPFUL LIBRARY BELOW ============*/

%xymapelement(Map,X,Y,E). to E einai to periexomeno tou Map sti thesi (x,y)
xymapelement(Map,X,Y,E):-map1(Map), nth_element(Map,Y,L),nth_element(L,X,E).

%mapelementposition(Map,E,X,Y) briskei tis syntetagmenes X,Y toy E sto map
mapelementposition(Map,E,X,Y):- map1(Map), xymapelement(Map,X,Y,E).

%printlist(List) typwnei orizontia ta stoixeia tis listas List
printlist([]):-nl.
printlist([X|Xs]):- write(X), write(" "), printlist(Xs).
%printmap(Map)  typwnei omoiomorfa to xarti Map
printmap([]):-nl.
printmap([Line|Lines]):- printlist(Line), printmap(Lines).
%map_maxXY(Map,MaxX,MaxY) epistrefei ta maxX kai MaxY toy xarti map
map_maxXY([],0,0).
map_maxXY([Line|Lines],MaxX,MaxY):- listlength([Line|Lines],MaxY), listlength(Line,MaxX).

%sumlist(List,S) athroism
sumlist([],0).
sumlist([X],S):- S is X,integer(X).
sumlist([X|Xs],S):- sumlist(Xs,P), S is P+X.

%multlist(List,M) Ginomeno
multlist([],0).
multlist([X],S):- S is X,integer(X).
multlist([X|Xs],S):- multlist(Xs,P), S is P*X.
%listlength(List,L) mikos
listlength([],0).
listlength([_|Xs],L):- listlength(Xs,P), L is P+1.
%first_element(List, F)
first_element([],[]).
first_element([X|_],X).
%last_element(List,L)
last_element(X,L):- reverse(X,Y),first_element(Y,L).
%nth_element(List,N,E)

nth_element([X|_],1,X).
nth_element([_|Xs],N,E):-nth_element(Xs,M,E), N is M+1.
%element_position(List,E,N) epistrefei thesi
element_position(List,E,N):-nth_element(List,N,E).
%my_member(X,List) x member of list
my_member(X,[X|_]).
my_member(X,[_|Xs]):-my_member(X,Xs).
%my_select(X,List,Rest) X stoixeio tis listas, rest i ypoloipi lista
my_select(X,[X|Xs],Xs).
my_select(X,[_|Xs],Rest):-my_select(X,Xs,Rest).