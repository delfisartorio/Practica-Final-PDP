toma(juan, coca).
toma(juan, vino(malbec, 3)).
toma(daiana, cerveza(golden, 18, 0)). 
toma(gisela, cerveza(ipa, 52, 7)). 
toma(edu, cerveza(stout, 28, 6)).

tieneProblemas(Persona):-
    findall(C, (toma(Persona, cerveza(C,_,A)), A>0), Cs),
    findall(V, toma(Persona, vino(V,_)), Vs), 
    findall(T, toma(Persona, T), Ts),
    length(Cs, CCs),
    length(Vs, CVs),
    length(Ts, CTs),
    CTS is CCs + CVs.

% 1.a. Verdadero, ya que las condiciones para filtrar en los findall varia segun la bebida.
% 1.b. Falso. Sin una explicacion del contexto cuesta entender a que se refieren C,V,T Cs,Vs y Ts.
% 1.c. Verdadero. podria hacerse un predicado tieneAlcohol(Bebida), que trataria polimorficamente al tipo de bebida, independiente de si es vino, cerveza o sin alcohol.

% 2. tieneProblemas(P). Mostrará a todas las personas que toman la misma cantidad de gaseosas que de alcohol

% 3.

tieneProblemasN(Persona):-
    toma(Persona,_),
    bebidasAlcoholicasQueTomo(Persona, CantBebidasAlcoholicas),
    bebidasSinAlcoholQueTomo(Persona, CantBebidasSinAlcohol),
    CantBebidasAlcoholicas is CantBebidasSinAlcohol.

bebidasAlcoholicasQueTomo(Persona, Cant):-
    findall(BebidaAlcoholica, (tieneAlcohol(BebidaAlcoholica), toma(Persona, BebidaAlcoholica)), BebidasAlcoholicas),
    length(BebidasAlcoholicas, Cant).

bebidasSinAlcoholQueTomo(Persona, Cant):-
    findall(Gaseosa, (not(tieneAlcohol(Gaseosa)), toma(Persona, Gaseosa)), Gaseosas),
    length(Gaseosas, Cant).

tieneAlcohol(Bebida):-
    toma(_,vino(_,_)).
tieneAlcohol(Bebida):-
    toma(_,cerveza(_,_,NivelAlcohol)),
    NivelAlcohol > 0.