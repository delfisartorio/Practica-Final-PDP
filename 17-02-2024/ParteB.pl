%tiene(Persona, Cosa).
%vale(Cosa, Valor).

todoLoQueTieneEsMasValioso(Persona1, Persona2):-
    tiene(Persona1, _),
    tiene(Persona2, _),
    Persona1 /= Persona2,
    forall((tiene(Persona1, CosaValiosa), tiene(Persona2, OtraCosa), vale(CosaValiosa, ValorCosaValiosa), vale(OtraCosa, OtroValor)), ValorCosaValiosa > OtroValor).

% A. El predicado como esta en el enunciado no es inversible, por lo que se puede saber si nadie tiene cosas, pero en caso contrario no se puede saber QUIENES tienen cosas mas valiosas.

% B. todoLoQueTieneEsMasValioso(pedro, Persona).