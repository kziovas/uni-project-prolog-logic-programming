list([]).
list([_|Xs]) :- list(Xs).


/*--------------------------*/
/* addlist([4,5,6,7],s) summ*/
/*?- addlist([3,4,5],X).      */
/* X=12                     */
/*--------------------------*/

addlist([],0).
addlist([X|Xs],S) :- addlist(Xs,K), S is K+X.

/*------------------------------*/
/* mullist([4,5,6,7],s) multiply*/
/*?- mullist([3,4,5],X).          */
/* X=60                         */
/*------------------------------*/

mullist([],1).
mullist([X|Xs],S) :- mullist(Xs,K), S is K*X.

/*----------------------------------*/
/* listlen([4,5,6,7],s) list length */
/*?- mullist([3,4,5],X).            */
/* X=60                             */
/*----------------------------------*/

listlen([],0).
listlen([X|Xs],S) :- listlen(Xs,K), S is K+1.

/*----------------------------------*/
/* rev([4,5,6,7],S) reverse list    */
/*?- rev([3,4,5],X).                */
/* X=[5,4,3].                       */
/*----------------------------------*/

rev([],[]).
rev([X|Xs],R) :- rev(Xs,S), append(S,[X],R).




/*Finds first element of a list*/
first_element([X|Xs],X).



/*Finds last element of a list with multiple ways*/

/*Solution1*/
last_element1(List,X):- rev(List,R), first_element(R,X).


/*Solution2*/
last_element2([X],X).
last_element2([X|Xs],Y) :- last_element2(Xs,Y).

/*Solution3*/
last_element3(List,X) :- append(_,[X],List).


/*--------------------------------------------*/
/* nth1([4,5,6,7],N,E) N_th element of list    */
/*?- nth1([4,5,6,7],3,E).                      */
/* E= 6                                       */
/*--------------------------------------------*/

nth1([X|Xs],1,X) :- !.
nth1([X|Xs],N,Y) :- N>1, M is N-1, nth1(Xs,M,Y).



/*-----------------------------------------------------*/
/* nth2([4,5,6,7],N,E) The position N of an element    */
/*?- nth2([4,5,6,7],3,E).                              */
/* E= 6                                                */
/*-----------------------------------------------------*/

nth2([X|Xs],1,X).
nth2([X|Xs],N,E) :- nth2(Xs,M,E), N is M+1.

