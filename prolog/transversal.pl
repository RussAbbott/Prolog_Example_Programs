/** <examples>
?- transversal_prolog([[1, 2, 3], [2, 4], [1]], [], Complete_Transversal).
*/                
transversal_prolog(Sets, Partial_Transversal, _Complete_Transversal) :-
    writeln('Sets'/Sets;'  Partial_Transversal'/Partial_Transversal), 
    fail.

transversal_prolog([], Complete_Transversal, Complete_Transversal) :-
    format('                                  '),
    writeln('Complete_Transversal '=Complete_Transversal), nl.

transversal_prolog([S|Ss], Partial_Transversal, Complete_Transversal_X) :-
    member(X, S),
    \+ member(X, Partial_Transversal),
    append(Partial_Transversal, [X], Partial_Transversal_X),
    transversal_prolog(Ss, Partial_Transversal_X, Complete_Transversal_X).


