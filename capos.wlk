object rolando {
    
    var property capacidadMochila = 2  
    const mochila = #{}
    const historial = []
    method encontrar(artefacto) {
      historial.add(artefacto)
      if(self.puedeRecolectar(artefacto)){
        mochila.add(artefacto)
      }
    }
    method mochila() {
      return mochila
    }

    method puedeRecolectar(artefacto) {
      return self.capacidadMochila() > mochila.size()
    }
	method tiene(artefacto){
        return mochila.contains(artefacto)
    }
    method llegarACastillo() {
      castillo.guardarArt(mochila)
      mochila.clear()
    }
    method posesiones() {
      return mochila.union(castillo.artefactos())
    }
    method historialDeArtefactos() {
      return historial
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













