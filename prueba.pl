%Términos
animal(conejo).
animal(perro).
animal(gato).
animal(caballo).

herbivoro(conejo).
herbivoro(caballo).
carnivoro(perro).
carnivoro(gato).

plantaComestible(lechuga).
plantaComestible(zanahoria).

%Hechos
masDebil(conejo,perro).
masDebil(gato,perro).
masDebil(perro,caballo).
masDebil(conejo,gato).
masDebil(gato,caballo).

%Reglas
come(A,B) :-
    carnivoro(A), animal(B), masDebil(B,A);
    herbivoro(A), plantaComestible(B).





