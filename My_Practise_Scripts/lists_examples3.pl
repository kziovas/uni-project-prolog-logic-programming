/*-------------------------*/
/*  slect(List,E,Rest)     */
/*  -? slect([a,b,c],X,R)  */
/* X=a                     */
/* R=[b,c]                 */
/* X=b                     */
/* R=[a,c]                 */
/*-------------------------*/

slect([E|Xs],E,Xs) :- !.
slect([E|Xs],E,Rest,Rest2):- append(Rest2,Xs,Rest).
slect([Y|Xs],E,Rest,Rest2):-  slect(Xs,E,Rest,Rest1),append(Rest2,[Y],Rest1).  
slect([Y|Xs],E,Rest):- slect(Xs,E,Rest,Rest2),append(Rest1,[Y],Rest2),!.


