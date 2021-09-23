mselect(X,[X|Xs],Xs).
mselect(X,[Y|Xs],R) :-  append([Y],K,R),mselect(X,Xs,K),!.