list([]).
list([_|Xs]) :- list(Xs).

/*------------------------------*/
/* addlist([4,5,6,7],S) summ 	*/
/* ?- addlist([3,4,5],X).	*/
/* X=12				*/
/*------------------------------*/

addlist([],0).
addlist([X|Xs],S) :- addlist(Xs,K), S is K+X.

/*------------------------------*/
/* mullist(List,M) multiply 	*/
/* ?- mullist([3,4,5],X).	*/
/* X=60			*/
/*------------------------------*/
mullist([],1).
mullist([X|Xs],S) :- mullist(Xs,K), S is K*X.

/*--------------------------------------*/
/* listlength(List,M) no of elements 	*/
/* ?- listlength([3,4,5],X).		*/
/* X=3					*/
/*--------------------------------------*/
listlength([],0).
listlength([_|Xs],S) :- listlength(Xs,K), S is K+1.

/*--------------------------------------*/
/* listlength(List,M) no of elements 	*/
/* ?- listlength([3,4,5],X).		*/
/* X=3					*/
/*--------------------------------------*/
reverse([],[]).
reverse([X|Xs],R) :- 
	reverse(Xs,Ys), append(Ys,[X],R).

/*--------------------------------------*/
/* first_element(List,First).		*/
/* first_element([a,b,c],X).		*/
/* X=a					*/
/*--------------------------------------*/
first_element([X|_],X).


/*--------------------------------------*/
/* last_element(List,Last).		*/
/* last_element([a,b,c],X).		*/
/* X=c					*/
/*--------------------------------------*/
/* Kostas Ziovas */
last_element1(List,X) :- 
	reverse(List,R), first_element(R,X).

/* Babis Avgeris */
last_element2([X],X).
last_element2([X|Xs],Y) :- last_element2(Xs,Y).

/* George Katsirelos */
last_element3(List,X) :- append(_,[X],List).

/*----------------------------------------------*/
/* nth_element1(List,N,E) Nth element of a list	*/
/* nth_element1([a,b,v,f,g],3,E).		*/
/* E=v						*/
/*----------------------------------------------*/
/* Chalkias Stathis, Georgia Karagianni */
nth_element1([X|Xs],1,X) :- !.
nth_element1([X|Xs],N,Y) :-
	M is N-1, nth_element1(Xs,M,Y).
/*----------------------------------------------*/
/* nth_element2(List,N,E) Nth element of a list	*/
/* nth_element2([a,b,b,b,g],N,b).		*/
/* N=2; N=3; N=4						*/
/*----------------------------------------------*/
/* Davakis Alexandros */
nth_element2([X|Xs],1,X).
nth_element2([X|Xs],N,E) :-
	nth_element2(Xs,M,E), N is M+1.

/*------------------------------*/
/* mymember(X,List)		*/
/* ?- mymember(X,[a,b,c]).	*/
/* X=a;				*/
/* X=b...			*/
/*------------------------------*/
/* Alitiras Vassilis 		*/
mymember(X,[X|_]).
mymember(X,[_|Xs]) :- mymember(X,Xs).

/*------------------------------*/
/* select(X,List,Rest)		*/
/* ?- select(X,[a,b,c],R).	*/
/* X=a				*/
/* R=[b,c];			*/
/* X=b				*/
/* R=[a,c];...			*/
/*------------------------------*/
/* Kyprianos Charis 		*/
select(X,[X|Xs],Xs).
select(X,[Y|Xs],[Y|Ks]) :- select(X,Xs,Ks).

mydelete(X,Xs,Xs) :- not(member(X,Xs)), !.
mydelete(X,[X|Xs],Xs) :- !.
mydelete(X,[Y|Xs],[Y|Ks]) :- mydelete(X,Xs,Ks), !.


/*------------------------------*/
/* removedouble(List,New)	*/
/*------------------------------*/
/* Chalkias Stathis		*/
/* Zapsis Symeon		*/
removedouble([X],[X]).
removedouble([X|Xs],Ys) :- 
	member(X,Xs),
	removedouble(Xs,Ys).
removedouble([X|Xs],[X|Ys]) :- 
	not(member(X,Xs)),
	removedouble(Xs,Ys).

