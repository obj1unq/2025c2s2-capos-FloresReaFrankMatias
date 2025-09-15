object rolando {
    
    var property capacidadMochila = 2  
    const mochila = []
    const historial = []
    var  property poderBase = 5 
    var hogar = castillo
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
    method llegarAHogar() {
      hogar.guardarArt(mochila)
      mochila.clear()
    }
    method posesiones() {
      //return mochila.union(hogar.artefactos())
      return  hogar.artefactos() + mochila
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

    method aporteDePoderDeArtefactos() {
      return  hogar.artefactos().map({ artefacto => artefacto.aporteDePoderA(self) })
    }
    method poderDelArtefactoMasPoderoso() {
      return self.aporteDePoderDeArtefactos().max()
    }

    method puedeVencer(enemigo) {
      return self.poderDePelea() > enemigo.poderDePelea() 
    }
    const enemigos =[ caterina, archibaldo, astra]
    method moradasQuePuedeConquistar() {
      return 
    }

}


//-----------------------------------------      Artefactos  -----------------------------------------
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
  var cantidadDeUsos= 0
  const librosDeHechizos =  [bendicion,  invisibilidad , invocacion]
  method usar() {
    cantidadDeUsos += 1
    librosDeHechizos.remove(self.primerHechizo())
  }
  method primerHechizo() {
   return  librosDeHechizos.first()
  }
  method aporteDePoderA(personaje) {
    if( not librosDeHechizos.isEmpty()  ){
      return self.primerHechizo().aporteDePoder(personaje)  
    }
    return 0
  }
}

object bendicion {
  
  method aporteDePoder(personaje) {
    return 4  
  }
}
object invisibilidad {
  
    method aporteDePoder(personaje) {
      return personaje.poderBase()
    }
}

object invocacion {
  
  method aporteDePoder(personaje) {
    return personaje.poderDelArtefactoMasPoderoso()
  }
 
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

//----------------            Posible Hogares    -------------------------------

object castillo {
    const artDelCastillo = []

    method guardarArt(artefactosDe) {
      
      artDelCastillo.addAll(artefactosDe)
    }
    method artefactos() {
      return artDelCastillo
    }
}


object fortalezaDeAcero {
  
}

object palacioDeMarmol {
  
}
object torreDeMarfil {
  
}



//----------------                -------------------------------

//rolando.encontrar(espadaDelDestino)
//rolando.encontrar(armaduraDeAceroValyrio)
//rolando.encontrar(collarDivino)

//----------------            Enemigos    -------------------------------

object caterina {
  
  //var hogar = fortalezaDeAcero
  method poderDePelea() {
    return 28
  }
  method hogar() {
    return fortalezaDeAcero
  }
}


object archibaldo {
  
  //var hogar = palacioDeMarmol
  method poderDePelea() {
    return 16
  }
  method hogar() {
    return palacioDeMarmol
  }
}

object astra {
  
  
  method poderDePelea() {
    return 14
  }
  method hogar() {
    return torreDeMarfil
  }


}



