object rolando {
    
    var property capacidadMochila = 2  
    const artRecolectados = #{}

    method encontrar(artefacto) {
      if(self.puedeRecolectar(artefacto)){
        artRecolectados.add(artefacto)
      }
    }
    method mochila() {
      return artRecolectados
    }

    method puedeRecolectar(artefacto) {
      return self.capacidadMochila() > artRecolectados.size()
    }
	method tiene(artefacto){
        return artRecolectados.contains(artefacto)
    }
    method llegarACastillo() {
      castillo.guardarArt(artRecolectados)
      artRecolectados.clear()
    }
}


//Artefactos
object espadaDelDestino { 
}
object libroDeHechizos {
 
}
object collarDivino {  
}
object armaduraDeAceroValyrio {
}


object castillo {
    const artDelCastillo = #{}

    method guardarArt(artefactosDe) {
       artefactosDe.forEach({artefactosDe=>artDelCastillo.add(artefactosDe)})
    
    }
    method artefactos() {
      return artDelCastillo
    }
}













