:- discontiguous
        hombre/3,
        mujer/3.

%TÉRMINOS---------------------------------------------------------
%género(nombre,fecha_nacimiento,fecha_defunción)

hombre(odin,1880,1937).
hombre(walter,1952,2005).
hombre(sam,1950,1983).
hombre(calvin,1950,1961).
hombre(gus,1969,1982).
hombre(gregory,1976,1977).
hombre(lewis,1988,2010).
hombre(milton,1992,2003).

mujer(edie,1917,2010).
mujer(barbara,1944,1960).
mujer(molly,1937,1947).
mujer(dawn,1968,2016).
mujer(edith,1999,null).


%Padre o madre de...---------------------------------------------

progenitor(odin,[edie]).
progenitor(edie,[sam,calvin,barbara,molly,walter]).
progenitor(sam,[gus,gregory,dawn]).
progenitor(dawn,[lewis,milton,edith]).


%REGLAS del árbol genealógigo-------------------------------------

padreDe(Padre,Hijo):- progenitor(Padre,Hijos), 
					  member(Hijo,Hijos),
					  hombre(Padre,_,_).

madreDe(Madre,Hijo):- progenitor(Madre,Hijos), 
					  member(Hijo,Hijos),
					  mujer(Madre,_,_).

abueloDe(Abuelo,Nieto):- padreDe(Abuelo,PadreMadre),
						 (padreDe(PadreMadre,Nieto);
						 	madreDe(PadreMadre,Nieto)).

abuelaDe(Abuela,Nieto):- madreDe(Abuela,PadreMadre),
						 (padreDe(PadreMadre,Nieto);
						 	madreDe(PadreMadre,Nieto)).	

bisabueloDe(Bis,Nieto):- padreDe(Bis,Abu),
						 (abueloDe(Abu,Nieto);
						 	abuelaDe(Abu,Nieto)).

bisabuelaDe(Bis,Nieto):- madreDe(Bis,Abu),
						 (abueloDe(Abu,Nieto);
						 	abuelaDe(Abu,Nieto)).

tatarabueloDe(Tata,Nieto):- padreDe(Tata,Bis),
							(bisabueloDe(Bis,Nieto);
								bisabuelaDe(Bis,Nieto)).

tatarabuelaDe(Tata,Nieto):- madreDe(Tata,Bis),
							(bisabueloDe(Bis,Nieto);
								bisabuelaDe(Bis,Nieto)).

hermanoDe(X,Y):- (padreDe(Z,X);
					madreDe(Z,X)),
				 (padreDe(Z,Y);
				 	madreDe(Z,Y)),
				 hombre(X,_,_),
				 not(X==Y).		

hermanaDe(X,Y):- (padreDe(Z,X);
					madreDe(Z,X)),
				 (padreDe(Z,Y);
				 	madreDe(Z,Y)),
				 mujer(X,_,_),
				 not(X==Y).					 													

tioDe(Tio,Sobrino):- hermanoDe(Tio,PapaMama),
					(padreDe(PapaMama,Sobrino);
						madreDe(PapaMama,Sobrino)).

tiaDe(Tia,Sobrino):- hermanaDe(Tia,PapaMama),
					(padreDe(PapaMama,Sobrino);
						madreDe(PapaMama,Sobrino)).		


%REGLAS edad de defunción----------------------------------------------------
listaFechas(L,X):- L=[F,I],
				   (hombre(X,I,_);
				   	mujer(X,I,_)),
				   (hombre(X,_,F);
				   	mujer(X,_,F)).

resta_lista([],0).
resta_lista([X|Y],Z):- resta_lista(Y,Z1),Z is X-Z1.

murioEdad(Persona,Edad):- listaFechas(L,Persona),
						 resta_lista(L,Edad).
