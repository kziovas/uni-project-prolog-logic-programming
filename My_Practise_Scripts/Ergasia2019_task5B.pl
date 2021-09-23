
differentiate(F, SDF) :- diff(F, DF), simpl(DF, SDF).
diff(C, 0) :- integer(C). /* 1 */
diff(x, 1). /* 2 */
diff(F+G, DF+DG) :- diff(F, DF), diff(G, DG). /* 3 */
diff(-F, -DF) :- diff(F, DF). /* 4 */
diff(F-G, DF-DG) :- diff(F, DF), diff(G, DG). /* 5 */
diff(C*F, C*DF) :- integer(C), !, diff(F, DF). /* 6 */
diff(F*G, F*DG+G*DF) :- diff(F, DF), diff(G, DG). /* 7 */
diff(F/G, (G*DF-F*DG)/G^2) :- diff(F, DF), diff(G, DG). /* 8 */
diff(F^C, C*F^(C-1)*DF) :- integer(C), diff(F, DF). /* 9 */
diff(sin(F), cos(F)*DF) :- diff(F, DF). /* 10 */
diff(cos(F), -sin(F)*DF) :- diff(F, DF). /* 11 */
diff(log(F), (1/F)*DF) :- diff(F, DF). /* 12 */
diff(exp(F), exp(F)*DF) :- diff(F, DF). /* 13 */
simpl(F, SF2) :- simplify(F, SF1), !, simpl(SF1, SF2).
simpl(F, F).
simplify(A+B, C) :- integer(A), integer(B), !, C is A+B.
simplify(A-B, C) :- integer(A), integer(B), !, C is A-B.
simplify(A*B, C) :- integer(A), integer(B), !, C is A*B.
simplify(0+F, F) :- !.
simplify(F+0, F) :- !.
simplify(1*F, F) :- !.
simplify(F*1, F) :- !.
simplify(0*_, 0) :- !.
simplify(_*0, 0) :- !.
simplify(F^1, F) :- !.
simplify(-F, -SF) :- simplify(F, SF).
simplify(F+G, F+SG) :- simplify(G, SG).
simplify(F+G, SF+G) :- simplify(F, SF).
simplify(F-G, F-SG) :- simplify(G, SG).
simplify(F-G, SF-G) :- simplify(F, SF).
simplify(F*G, F*SG) :- simplify(G, SG).
simplify(F*G, SF*G) :- simplify(F, SF).
simplify(F/G, F/SG) :- simplify(G, SG).
simplify(F/G, SF/G) :- simplify(F, SF).
simplify(F^G, F^SG) :- simplify(G, SG).
simplify(F^G, SF^G) :- simplify(F, SF).
simplify(F*(G*H), (F*G)*H). 




