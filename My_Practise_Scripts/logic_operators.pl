and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

not(0,1).
not(1,0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

if(0,0,1).
if(1,0,0).
if(0,1,1).
if(1,1,1).

equiv(0,0,1).
equiv(1,0,0).
equiv(0,1,0).
equiv(1,1,1).


and(X,Y,Z):- Z is X*Y.
or(X,Y,Z):- Z is X+Y-X*Y.
not(X,Y):- Y is 1-X.
xor(X,Y,Z):- Z is (X-Y)*(X-Y) /*I ALLIWS abs(X-Y)

