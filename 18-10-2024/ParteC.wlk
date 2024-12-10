// class Calendario {
//     var eventos
//     method estaLibre(fecha) =
//         eventos.all({evento =>
//             evento.esRecordatorio() or (not evento.esRecordatorio() and evento.fecha() != fecha)
//         })
// }

// class EventoDiaCompleto {
//     var property fecha
//     method esRecordatorio() { return false }
// }

// class Recordatorio {
//     method esRecordatorio() { return true }
// }


// 1.a. Falso. Ya hay polimorfismo porque todos los eventos entienden el mensaje esRecordatorio()
// 1.b. Falso. Si se tiene una lista de fechas, evento.fecha() devolveria una lista de fechas, que no se puede comparar directamente con la fecha recibida por parametro. (debido a como esta codeado el metodo)



 class Calendario {
     var eventos
     method estaLibre(fecha) = eventos.all({evento => evento.tieneLibre(fecha)})
 }

 class EventoDiaCompleto {
     var property fecha
     method esRecordatorio() { return false }


    method tieneLibre(unaFecha) = unaFecha != self.fecha()
 }

 class Recordatorio {
     method esRecordatorio() { return true }
     method tieneLibre(fecha) = true
 }
