#Ejercicio 1
#Predicado para encontrar el máximo elemento en una lista.
max_elemento([X],X) :- !.
max_elemento([X|Xs], M):- max_elemento(Xs, M), M >= X, !.
max_elemento([X|Xs], X):- max_elemento(Xs, M), X >  M.

#Ejercicio 2
#Predicado auxiliar que nos ayuda a sumar todos los elementos de una lista
suma_elementos([], 0).
suma_elementos([X|Xs], S) :-
    suma_elementos(Xs, S2),
    S is S2 + X.

#Predicado auxiliar que usa la suma total calculada
combina_con_suma([], _, []).
combina_con_suma([X|Xs], SumaL1, [Y|L]) :-
    Y is X + SumaL1,                
    combina_con_suma(Xs, SumaL1, L).

#Predicado  que recibe una lista L1 de números y a partir de ella construye L2.
combina(L1, L2) :-
    suma_elementos(L1, SumaL1),   
    combina_con_suma(L1, SumaL1, L2).

#Ejercicio 3
#Predicado auxiliar que separa la lista en una parte creciente y el resto
creciente([X, Y | Resto], [Y | Resto]) :-
    X >= Y.
creciente([X, Y | Resto], ParteDecreciente) :-
    X < Y,
    creciente([Y | Resto], ParteDecreciente).
creciente([_], []).  

#Predicado auxiliar que verifica si la lista es decreciente
decreciente([_]).
decreciente([X, Y | Resto]) :-
    X > Y,
    decreciente([Y | Resto]).

convexo(L1) :-
    creciente(L1, ParteDecreciente),
    decreciente(ParteDecreciente).

#Ejercicio 4
arma(espada).
arma(arco).
arma(lanza).

ataque(fuego).
ataque(garras).
ataque(sonoro).

ganar(lanza, fuego):-
    write('El caballero usa su lanza antes de ser alcanzado por el fuego y vence al dragón.').
ganar(espada, garras):-
    write('El caballero bloquea el ataque con su espada y vence al dragón.').
ganar(arco, sonoro):-
    write('El caballero usa su arco antes del rugido del dragón y vence al dragón.').
perder(espada, fuego):-
    write('El caballero no logra bloquear el fuego con su espada y pierde contra el dragón.').
perder(espada, sonoro):-
    write('El caballero no logra bloquear el rugido del dragón con su espada y pierde').
perder(lanza, garras):-
    write('El caballero usa su lanza para vencer a las temibles garras del dragón y es vencido').
perder(lanza, sonoro):-
    write('El caballero usa su lanza pero no logra vencer el rugido del dragón').
perder(arco, garras):-
    write('El cablallero dispara las flechas del arco pero no logra vencer las garras del dragón').
perder(arco, fuego):-
    write('El caballero usa su lanza y dispara flechas contra el fuego del dragón, pero las llamas lo alcanzan y es vencido').

batalla(Caballero, Dragon):-
    ganar(Caballero, Dragon),
    write('El caballero ganó la batalla :D').

batalla(Caballero, Dragon):-
    perder(Caballero, Dragon),
    write('El caballero fue derrotado.').

inicio_batalla:-
    write('Elige el arma que usará el caballero: espada, lanza o arco'),
    read(Arma),
    arma(Arma),
    
    write('Elige el ataque del dragón: fuego, garras o sonoro :o'),
    read(Ataque),
    batalla(Arma, Ataque).