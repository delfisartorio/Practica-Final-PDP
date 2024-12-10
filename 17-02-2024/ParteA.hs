sirve :: Problema -> Habilidad -> Bool

habilidades :: Persona -> [Habilidad]

podrianAyudar :: Problema -> [Persona] -> [Persona]
podrianAyudar unProblema unasPersonas = filter (puedeAyudar unProblema) unasPersonas

puedeAyudar unProblema unaPersona = any (sirve unProblema) $ habilidades unaPersona

-- Gracias a la lazy evaluation, con que una sola de las infinitas habilidades que tiene la persona sirva para resolver el problema, alcanza para que podriaAyudar retorne true, y por lo tanto sea agregada la persona a la lista de personas que pueden ayudar


