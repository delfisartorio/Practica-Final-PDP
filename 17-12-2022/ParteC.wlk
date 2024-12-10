// 1. No hay declaratividad porque el codigo es dificil de entender con simplemente leerlo. Tampoco hay polimorfismo porque no se tratan indistintamente a los juegos. Falta delegacion porque hay sobrecarga de logica en los metodos, se rompe el encapsulamiento al estar una persona comparando atributos de un juego, y por ultimo si se respeta la herencia que realiza un videojuego de la clase juego.

class Persona {
    var property edad
    var property consolas = []

    method puedeJugar(unJuego){
        unJuego.cumpleRequisitos(self)
    }

    method tieneAlgunaDeLasConsolas(unasConsolas) = consolas.contains(unasConsolas)
}

class Juego {
    var property tipo
    var property edadMinima
    var property edadMaxima

    method cumpleRequisitos(unaPersona) 
}

class Videojuego inherits Juego {
    var property consolasPosibles
    var property genero

    override method cumpleRequisitos(unaPersona) = self.tieneEdadParaJugar(unaPersona) && unaPersona.tieneAlgunaDeLasConsolas(consolasPosibles) 
    

    method tieneEdadParaJugar(unaPersona) = unaPersona.edad().between(self.genero().edadMinima(), 80)
}

class JuegoDeMesa inherits Juego {
    
}