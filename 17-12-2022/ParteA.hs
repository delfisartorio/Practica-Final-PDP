data Producto = Prod {
    nombre :: String,
    precio :: Int
}
queEmpieceConA :: Producto -> Bool
queEmpieceConA = (== 'a') . head . nombre

barato :: Producto -> Bool
barato = (< 50) . precio

-- 1
restriccionesDeCompra :: [Producto -> Bool]
restriccionesDeCompra = [queEmpieceConA, barato]

-- 2
queEmpieceCon :: Char -> Producto -> Bool
queEmpieceCon unaLetra = (== unaLetra) . head . nombre

-- Para que restriccionesDeCompra siga siendo una lista de funciones Producto -> Bool, 
-- queEmpieceCon debe estar aplicada parcialmente, con una letra pasada por parametro

-- 3
type Restriccion = Producto -> Bool

verificanTodo :: [Producto] -> [Restriccion] -> [Producto]
verificanTodo productos restricciones = filter (cumpleTodasLasRestricciones restricciones) productos

cumpleTodasLasRestricciones :: [Restriccion] -> Producto -> Bool
cumpleTodasLasRestricciones restricciones unProducto = all ($ unProducto) restricciones

-- Se destaca la declaratividad en los nombres de las funciones y la delegación en cumpleTodasLasRestricciones

