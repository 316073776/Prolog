%Términos
hombre(abraham).
hombre(clancy).
hombre(herb).
hombre(homero).
hombre(bart).

mujer(mona).
mujer(jackie).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(lisa).
mujer(maggie).

%Héchos
padre_de(homero,bart).
padre_de(homero,lisa).
padre_de(homero,maggie).
padre_de(abraham,homero).
padre_de(abraham,herb).
padre_de(clancy,patty).
padre_de(clancy,selma).
padre_de(clancy,marge).

madre_de(marge,bart).
madre_de(marge,lisa).
madre_de(marge,maggie).
madre_de(mona,homero).
madre_de(mona,herb).
madre_de(selma,ling).
madre_de(jackie,patty).
madre_de(jackie,selma).
madre_de(jackie,marge).

esposo_de(abraham, mona).
esposo_de(clancy, jackie).
esposo_de(homero, marge).

%Reglas

antecesor_de(X,Y):- padre_de(X,Y);
					madre_de(X,Y).

antecesor_de(X,Y):- (padre_de(X,Y);
					madre_de(X,Y)),
     				antecesor_de(Z,Y).








