/*swish.swi-prolog.org*/

/*fact*/
/*oikogenia_aliftira*/
parents(vasilis_al,giorgos_al,dina_an). 
parents(stratos_kal,kostas_kal,lola_al). 
parents(sotiris_kal,kostas_kal,lola_kal).  
parents(anthi_kaf,vasilis_kaf,roula_an).  
parents(eleftheria_kaf,vasilis_kaf,roula_an).  
parents(ntina_an,mitsos_an,anthoula_mp).  
parents(roula_an,mitsos_an,anthoula_mp).
parents(giorgos_al,vasilis_al_s,loukia_ka).
parents(lola_al,vasilis_al_s,loukia_ka).
parents(anna_al,vasilis_al_s,loukia_ka).
parents(mitsos_an,giorgos_an,stavroula_r).
/*parents(giorgos_an, Jenghis_Khan,mistress.random.randint(1)).*/
  

/*oikogenia_ziova*/
parents(kostas_ziov,vasilis_ziov,maria_timp). 
parents(eleni_ziov,vasilis_ziov,maria_timp). 
parents(mixalis_ziov,vissarion_ziov,rita_zor). 
parents(apostolis_ziov,vissarion_ziov,rita_zor). 
parents(vasilis_timp,fanis_timp,olga_r). 
parents(kakia_timp,fanis_timp,olga_r). 
parents(vasilis_ziov,mixalis_s_ziov,ntina_kal). 
parents(vissarion_ziov,mixalis_s_ziov,ntina_kal). 
parents(maria_timp,vasilis_s_timp,kitsa_r). 
parents(fanis_timp,vasilis_s_timp,kitsa_r). 
parents(mixalis_s_ziov,dimitris_ziov,papadia).
/*parents(dimitris_ziov, Jenghis_Khan,mistress.random.randint(1))*/
  


/*rules*/
siblings(X,Y) :- parents(X,A,B), parents(Y,A,B),X\=Y.
father(F,K) :- parents(K,F,_).
mother(M,K) :- parents(K,_,M).
parent(P,K) :- ( parents(K,P,_); parents(K,_,P)).
cousins(K1,K2) :- ( parents(K1,P1,_); parents(K1,_,P1)),( parents(K2,P2,_); parents(K2,_,P2)),siblings(P1,P2).
grandfath(GF,K) :- ( parents(K,P,_); parents(K,_,P)),parents(P,GF,_).
grandmoth(GM,K) :- ( parents(K,P,_); parents(K,_,P)),parents(P,_,GM).
grandparent(GP,K) :- ( parents(K,P,_); parents(K,_,P)), (parents(P,GP,_);parents(P,_,GP)).
greatgrandfather(GGF,K) :- grandfath(GF,K),father(GGF,GF).
greatgrandmother(GGM,K) :- grandmoth(GM,K),mother(GGM,GM).