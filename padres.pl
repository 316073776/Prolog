padreDe(juan, pablo).
padreDe(pablo, andres).
padreDe(andres, gustavo).

antecesor_de(X,Y):- padreDe(X,Y).
antecesor_de(X,Y):- padreDe(X,Z), antecesor_de(Z,Y).
