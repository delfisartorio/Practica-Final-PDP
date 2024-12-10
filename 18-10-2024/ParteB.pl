% comproMarca(Cliente, Marca).

precio(lata(atun, 100, nereida), 70).
precio(lata(atun, 200, nereida), 120).
precio(lacteo(laSerenisima, leche), 15).
precio(lacteo(sancor, leche), 22).

compro(martina, lata(atun, 100, nereida)).
compro(martina, lacteo(sancor, leche)).
compro(aye, lacteo(sancor, leche)).

cliente(Cliente) :- 
    compro(Cliente, _).

comproMarca(UnCliente, UnaMarca):-
    cliente(UnCliente),
    compro(UnCliente, UnProducto),
    marcaDelProducto(UnProducto, UnaMarca).

marcaDelProducto(lacteo(Marca,_),Marca):-
    precio(lacteo(Marca,_),_).

marcaDelProducto(lata(_,_,Marca), Marca):-
    precio(lata(_,_,Marca),_).

marcaPopu1(Marca):-
    forall(cliente(Cliente), comproMarca(Cliente, Marca)).      %Esta mal porque no se liga la marca

marcaPopu2(Marca):-
    cliente(Cliente),
    forall(cliente(Cliente), comproMarca(Cliente, Marca)).      %Tampoco se liga la marca, y el forall se aplica sobre un solo cliente, no sobre todos los clientes

marcaPopu3(Marca):-
    marcaDelProducto(_,Marca),
    forall(cliente(Cliente), comproMarca(Cliente, Marca)).      %Esta si funca, porque liga la marca