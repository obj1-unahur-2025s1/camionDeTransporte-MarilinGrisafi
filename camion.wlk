object camion {
    const property cargaCamion= []

    method cargar(unaCarga){
        cargaCamion.add(unaCarga)
        unaCarga.cargar()}
    method descargar(unaCarga){cargaCamion.remove(unaCarga)}
    method pesoTotal(){cargaCamion.sum({c=>c.peso()})+1000}
    method pesoPar(){return cargaCamion.all({c=>c.peso()}).even()}
    method pesa(unaCosa, kilos){return unaCosa.peso() == kilos}
    method primeraCargaPeligrosa(){return self.cargaPeligrosa().first()}
    method cargaPeligrosa(){ return cargaCamion.filter({c=>c.esPeligrosa()})}
    method nivelDePeligrosidad(nroPeligro){ return cargaCamion.filter({c=>c.nivelPeligrosidad(nroPeligro)})}
    method estaExcedido(){ return self.pesoTotal()> 2500}
    method puedeCircularEnRuta(nroPeligro){return 
        !self.estaExcedido() &&
        self.nivelDePeligrosidad(nroPeligro).isEmpty()
        }
    method laCargaMasPesada(){return cargaCamion.max({c=>c.peso()})}
    method laCargaEntreY(menorPeso, mayorPeso){return 
        cargaCamion.peso({c=>c.peso()}).max(menorPeso) &&
        cargaCamion.peso({c=>c.peso()}).min(mayorPeso)
    }
    
}
