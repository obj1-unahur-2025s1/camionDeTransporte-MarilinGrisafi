object knightRider {

    method peso()=500
    method esPeligrosa()= true
    method nivelPeligrosidad()= 10
    method bultos()=1
    method cargar(){}
}

object bumblebee {
    var property transformacion = auto
    method peso()=800
    method esPeligrosa()= true
    method nivelPeligrosidad(){return if (transformacion == auto){15} else {30}}
    method transformar(transf){transformacion = transf}
    method bultos()=2
    method cargar(){ self.transformar(robot)}
}

object paqLadrillos {
    var property ladrillos = 1
    method peso() {return ladrillos *200}
    method esPeligrosa()= true
    method nivelPeligrosidad()=2
    method agregarLadrillos(cantLadrillos){ ladrillos = cantLadrillos}
    method bultos(){return if(ladrillos <100) {1} else if (300>ladrillos >101){2} else {3} }
    method cargar(){ladrillos = ladrillos +12 }
}

object arenaGranel {
    var property peso= 1

    method esPeligrosa()= true
    method nivelPeligrosidad()=1
    method modificarPeso(nuevoPeso){peso = nuevoPeso}
    method bultos()=1
    method cargar()= (peso -10).max(0)
}

object bateriaAntiaerea {
    var misiles = true
    method peso(){return if (misiles==true) {300} else {200}}
    method esPeligrosa(){return misiles== true}
    method nivelPeligrosidad(){return if(misiles==true){100} else {0}}
    method quitarMisiles(){misiles = false}
    method bultos(){ return if (misiles==true){2} else {1}}
    method cargar(){return misiles== true}
}

object contenedor {
    var cosasAdentro = []
    method peso()=100 + cosasAdentro.sum({c=>c.peso()})
    method esPeligrosa(){return cosasAdentro.any({c=>c.esPeligrosa()})}
    method nivelPeligrosidad(){return 
        if (cosasAdentro.isEmpty()) {0}
        else {cosasAdentro.forEach({c=>c.nivelPeligrosidad()}).max()}
        }//
    method agregar(objetoAdentro){cosasAdentro.add(objetoAdentro)}
    method bultos()= 1 + cosasAdentro.bultos()
    method cargar() {return cosasAdentro.forEach({c=>c.cargar()})}
}  

object residuosRadioactivos {
    var property peso = 1
    method esPeligrosa()= true
    method nivelPeligrosidad()=200
    method cambiarElPeso(nuevoPeso){peso=nuevoPeso}
    method bultos()=1
    method cargar()= peso + 15
}

object embalajeSeguridad {
    var cosaEnvuelta = contenedor
    method peso(){return cosaEnvuelta.peso()}
    method esPeligrosa()= cosaEnvuelta.esPeligrosa()
    method nivelPeligrosidad()=cosaEnvuelta.nivelPeligrosidad()/2
    method agregarCosaEnvuelta(unaCosa){ cosaEnvuelta = unaCosa}
    method bultos()=2
    method cargar(){}
}
object auto{}
object robot{}