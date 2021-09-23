/*-------------------------------------*/
/*       Melh ths oikogeneias          */
/*-------------------------------------*/

parents(kostas,vasilis,maria).
parents(eleni,vasilis,maria).
parents(apostolis,rakias,rita).
parents(mixalis,rakias,rita).
parents(vasilis_jnr,fanis,olga).
parents(kakia,fanis,olga).
parents([],[],alexandra). %Melh xwris tekna ta orizoume me kena sinola 

parents(xanthi_kal,kostas_kal,katerina).
parents(xristina_kal,kostas_kal,katerina).
parents(apostolis_kal,kostas_kal,katerina).

parents(kostas_kal,apostolis_kal_snr,xanthi_kal_snr).


parents(vasilis,mixalis_snr,ntina).
parents(rakias,mixalis_snr,ntina).
parents(maria,vasilis_snr,kiriaki).
parents(fanis,vasilis_snr,kiriaki).
parents(alexandra,vasilis_snr,kiriaki).

parents(apostolis_kal_snr,unknown1,unknown2).
parents(ntina,unknown1,unknown2).

/*-------------------------------------*/
/*       Oikogeniakes sxeseis          */
/*-------------------------------------*/
siblings(X,Y):- parents(X,F,M), parents(Y,F,M),(\+X=Y). %X kai Y aderfia
father(Father,Child):- parents(Child,Father,_). %Father o pateras tou Child
mother(Mother,Child) :- parents(Child,_,Mother). % Mother h mhtera tou Child
parent(Parent,Child):- parents(Child,Parent,_);parents(Child,_,Parent). % Parent enas apo tous goneis tou Child
gfather(Gfather,Child) :- parent(Parent,Child),father(Gfather,Parent). %gfather o papous tou Child
gmother(Gmother,Child) :- parent(Parent,Child),mother(Gmother,Parent). %gmother h giagia tou Child
all_kids(Kids,Father) :- findall(Kid,parents(Kid,Father,_),Kids).  %findall is a prolog function defined like this: findall(Temp variable, :Goal, -Bag). We look for instances of temp variable satisfying goal and unifies them in a list -Bag.
first_cousin(X,Y) :- parent(P1,X),parent(P2,Y),siblings(P1,P2). % X kai Y prwta ksaderfia
sec_cousin(X,Y):-parent(P1,X),parent(P2,Y),first_cousin(P1,P2). % X kai Y deutera ksaderfia
uncle(Uncle,X):- parent(P1,X),siblings(Uncle,P1),father(Uncle,_). %Uncle theios tou X. Edw orizoume mono theious eks aimatos
aunt(Aunt,X):-parent(P1,X),siblings(Aunt,P1),mother(Aunt,_). %Aunt theia tou X. Kai pali mono eks aimatos






