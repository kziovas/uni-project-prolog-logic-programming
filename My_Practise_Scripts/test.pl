my_append([],L2,L2).
my_append([X|Rest],L2,R):- R=[X|Temp],my_append(Rest,L2,Temp).
