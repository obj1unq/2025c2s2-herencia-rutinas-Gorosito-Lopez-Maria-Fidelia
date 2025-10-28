class Rutina {
    var  property tiempoDePractica = 0
    var property intensidad = 0

    method descanso() {
        return 0
    }

    method conteoCkal(){
        return 100 * (tiempoDePractica - self.descanso()) * intensidad
    }
}

class Running inherits Rutina {

    override method descanso(){
        if(self.tiempoDePractica() > 20){
            return 5
        }else{
            return 2
        }
    }


}

class Maraton inherits Running{
    override method conteoCkal(){
        return super()*2
    }
}

class Remo inherits Rutina{
    override method descanso(){
        return self.tiempoDePractica()/5
    }
    method inicializar(){
        self.intensidad(1.3)
    }
    
}

class RemoDeCompeticion inherits Remo{
    override method inicializar(){
        self.intensidad(1.7)
    }
    override method descanso(){
        return (2).max(super()-3)
    }
}

class Persona {
    var property kilosPorCaloria = null
    var property peso = 0
    method pesoPerdidoCon(rutina){
        return (peso - rutina.conteoCkal()/self.kilosPorCaloria()).truncate(3)
    }
    method entrenar(rutina){
        self.peso(self.pesoPerdidoCon(rutina))
    }

}

class Sedentario inherits Persona{

    method inicializarSedentarioCon(rutina){
        self.kilosPorCaloria(7000)
        rutina.tiempoDePractica(5)
    }
    
    method validarPeso(){
        if(self.peso()<=50){
            self.error("No pesa lo suficiente")
        }
    }
    override method entrenar(rutina){
        self.validarPeso()
        super(rutina)
    }
}

class Atleta inherits Persona{

    override method pesoPerdidoCon(rutina){
        return (super(rutina)+1).truncate(3)
    }
    /*
    method verificar(rutina){
        self.inicializarAtletaCon(rutina)
        return rutina.conteoCkal()/self.kilosPorCaloria()
    }*/

    method inicializarAtletaCon(rutina){
        rutina.tiempoDePractica(90)
        self.kilosPorCaloria(8000)
    }

    method validarCantidadDeCaloriasGastadas(rutina){
        if (rutina.conteoCkal() <= 10000 ){
            self.error("No es muy gymbro de tu parte esta rutina")
        }
    }
    override method entrenar(rutina){
        self.validarCantidadDeCaloriasGastadas(rutina) 
        //La idea es usar entrenar dentro del throw si se sabe que va a fallar 
        super(rutina)
    }
}

class Club{
    var property predios = [predio1,predio2]

    method mejorPredioPara(persona){
        
    }

    method prediosTranquisPara(persoma){

    }

    method rutinasMasExigentesPara(persona){

    }
}

object predio1{

}
object predio2{
    
}