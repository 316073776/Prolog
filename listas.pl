%Declaracion de listas.

lista(L):-L=[1,2,3,4,5].
lista(L):-Cola=[2,3,4,5], L=[1,Cola].
lista(L):-Cabeza=1, Cola=[2,3,4,5], L=[Cabeza|Cola].

%regla que devuelve la cabeza de uan lista.

%laCabeza([Cabeza|Cola],C):- Cabeza=C.
%laCabeza([Cabeza|Cola],Cabeza).
%laCabeza([C|T],C).
laCabeza([C|_],C).
laCola([C|T],T).

%suma elementos de una lista.

suma_lista([],0).

suma_lista([X|Y],Z):-suma_lista(Y,Z1),Z is X+Z1.


%encuentra el valor maximo.

maxList([L], L).
maxList([Cabeza|Cola], Max) :- maxList(Cola, MaxRec),
						Max is max(MaxRec, Cabeza).
						
						

% Tenemos una lista con los hijos de Homero y otra con los hijos de Clancy.

progenitor(homero,[bart,lisa,maggie]).
progenitor(clancy,[patty,selma,marge]).

% Creamos una regla de b�squeda.

padreDe(Padre,Hijo):- progenitor(Padre,Hijos) , member(Hijo,Hijos).