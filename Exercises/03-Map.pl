%     X: 1 2 3 4 5     Y
map1([
		[0,0,3,0,0],  %1
		[1,0,0,1,1],  %2
		[1,1,0,1,5],  %3
		[4,1,1,1,1],  %4
		[1,1,1,1,1]   %5
		]).
		
		

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








/*========  HELPFUL LIBRARY BELOW ============*/

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