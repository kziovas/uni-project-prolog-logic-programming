value(p,0).
value(q,1).
value(r,1).
value(s,0).
value(t,1).


and(X,Y,Z):- Z is X*Y.
or(X,Y,Z):- Z is X+Y-X*Y.
value(kai(A,B),V):- value(A,X),value(B,Y),and(X,Y,V).