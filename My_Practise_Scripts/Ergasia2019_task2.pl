/* ----------------------------------------- */
/* This is a library with functions which    */
/* perform various tasks on lists.           */
/* ----------------------------------------- */

sumlist([],Sum):- Sum is 0.
sumlist([X|Rest],Sum):- sumlist(Rest,S),Sum is S+X.


multlist([],Mult):- Mult is 1.
multlist([X|Rest],Mult):- multlist(Rest,M),Mult is M*X.

listlength([],L):- L is 0.
listlength([_|Rest],L):- listlength(Rest,Length), L is Length +1.


first_element([X|_],X).

last_element([X],Last):- Last is X.
last_element([_|Rest],Last):- last_element(Rest,Last).


nth_element([X|_],N,E):- N ==1, E is X,!.
nth_element([_|Rest],N,E):- N >1 , N2 is (N-1), nth_element(Rest,N2,E).


element_position([E|_], N, E) :- N is 1.
element_position([_|Rest],N, E) :- element_position(Rest,N2, E), N is (N2+1).


my_member(X,[X|_]).
my_member(X,[_|Rest]):- my_member(X,Rest).


my_select(X,[X|Xs],Rest):- Rest = Xs.
my_select(X,[Y|Xs],Rest) :- my_select(X,Xs,R), append([Y],R,Rest). /* Xreiazontai aggiles girw apo to Y gia an to diavasei san lista!!! gamw to kerato tou mish wra */


my_append([],L2,L2).
my_append([X|Rest],L2,R):- R=[X|Temp],my_append(Rest,L2,Temp),.

my_append2([],L,L).
my_append2([X|Xs],Y,[X|Zs]):- my_append2(Xs,Y,Zs).