object rolando {
    
    var property capacidadMochila = 2  
    const mochila = #{}
    const historial = []
    var  property poderBase = 5 

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
    
    method poderDePelea(){
      return poderBase + mochila.sum({artefacto => 
                              artefacto.aporteDePoderA(self)})
    }
    method lucharEnBatalla() {
      mochila.forEach({artefacto => artefacto.usar()})
      poderBase += 1
    }

}


//Artefactos
object espadaDelDestino { 

  var cantidadDeUsos = 0
  method usar() {
    cantidadDeUsos = cantidadDeUsos + 1
  }

  method aporteDePoderA(personaje) {
    return if(cantidadDeUsos == 0) personaje.poderBase()
           else personaje.poderBase() * 0.5
    


  }

}
object libroDeHechizos {
 
}
object collarDivino {  
var cantidadDeUsos = 0
  method usar() {
    cantidadDeUsos = cantidadDeUsos + 1
  }

  method aporteDePoderA(personaje) {
    return if(personaje.poderBase() >6 ) {3 + cantidadDeUsos}
           else                          {3}
  }


}
object armaduraDeAceroValyrio {
var cantidadDeUsos = 0
  method usar() {
    cantidadDeUsos = cantidadDeUsos + 1
  }

  method aporteDePoderA(personaje) {
    return 6
  }

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













