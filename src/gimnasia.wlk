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
        return self.tiempoDePractica().div(5)
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
        return (2).max(super())
    }
}

class Persona{
    method peso(){

    }
    method pesoPerdido(){
        
    }
}