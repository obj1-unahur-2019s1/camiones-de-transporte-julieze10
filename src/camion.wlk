import cosas.*

class Camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoTotal(){
		return cosas.sum({unaCosa => unaCosa.peso() }) + 1000}
	
	method exedidoDePeso(){
		return self.pesoTotal() > 2500}
		
	method objetosPeligrosos(nivel){return cosas.filter
		({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return self.objetosPeligrosos(cosa.nivelDePeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		//return cosas.all{unaCosa =>unaCosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad}
		return self.objetosPeligrosos(nivelMaximoPeligrosidad).isEmpty()
	}
}
