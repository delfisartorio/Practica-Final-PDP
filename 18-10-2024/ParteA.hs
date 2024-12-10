data Producto = Prod {
    nombre :: String,
    precio :: Float,
    precioCantidad :: Float
}

-- a
queEmpieceCon :: Char -> Producto -> Bool
queEmpieceCon unaLetra = (== unaLetra) . head . nombre

-- b
-- ???? Fumeteo RMX
-- Es raro que juan sea una lista de funciones en vez de un Data Persona.Applicative
-- Se podria modelar de la siguiente manera:
data Persona = Persona {
    nombrePersona :: String,
    requisitos :: [Producto -> Bool]
}

-- c
-- juan :: [Producto -> Bool]

productosElegidos :: Persona -> [Producto] -> [Producto]
productosElegidos unaPersona = filter (eligeElProducto unaPersona) 

eligeElProducto :: Persona -> Producto -> Bool
eligeElProducto unaPersona unProducto = all ($ unProducto)  (requisitos unaPersona)

