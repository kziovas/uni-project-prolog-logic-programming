/*In order to understand the cut ! operator try running the code with the ! in and out of the first statement*/
/*For example the query maxval(1,3) will not work if we dont have the ! */
maxval(X,Y):- X<Y, write('Max is:'), write(Y),!. 
maxval(X,Y):- write('Max is:'),write(X).