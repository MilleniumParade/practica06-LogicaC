max_elemento([X],X) :- !.
max_elemento([X|Xs], M):- max_elemento(Xs, M), M >= X, !.
max_elemento([X|Xs], X):- max_elemento(Xs, M), X >  M.