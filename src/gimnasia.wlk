class Rutina {
    var property tiempoDePractica = 0
    var property intensidad = 0
/*Esto podria solo usarse method tiempo y method intensidad, lo que me permite no usar var, dejando descanso como method (como estas), descanso 
recibe un parametro del tiempo */
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
    //deberia tener una validacion para poder saber si es una persona que puede hacer una rtuina en particular 
    /*una banda de methodos nuevos */

    /*agregar una validacion para todas las personas, se sobreescribe sobre cada una de las personas sedentario o atleta, pasandole rutina como parametro*/
}

class Sedentario inherits Persona{

    override method kilosPorCaloria(){
        return 7000
    }
    method validarPeso(){
        if(self.peso()<=50){
            self.error("No pesa lo suficiente")
        }
    }
    override method entrenar(rutina){
        rutina.tiempoDePractica(5)
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

    override method kilosPorCaloria(){
      return 8000
    }

    method validarCantidadDeCaloriasGastadas(rutina){
        if (rutina.conteoCkal() <= 10000 ){
            self.error("No es muy gymbro de tu parte esta rutina")
        }
    }//se esta duplicando por que s podria modelar una validacion para la rutina

    override method entrenar(rutina){
        rutina.tiempoDePractica(90)
        self.validarCantidadDeCaloriasGastadas(rutina) 
        //La idea es usar entrenar dentro del throw si se sabe que va a fallar 
        super(rutina)
    }
}

class Club{
    const predios

    method mejorPredioPara(persona){
        const maximasCaloriasGastadas = (predios.map({predio => predio.caloriasQueGastaria(persona)})).max()
        return predios.find({predio => predio.caloriasQueGastaria(persona) == maximasCaloriasGastadas})
    }

    method prediosTranquisPara(persona){
        //retorna una lista de predios
        return predios.filter({predio => predio.tieneRutinaConMenosDeCkal(500)})
    }

    method rutinasMasExigentesPara(persona){
        predios.map({predio => predio.rutinaMasExigente()})
    }
}

class Predio{
    const rutinas =[]

    method caloriasQueGastaria(persona){
       /*
       Idea: mapear las calorias persona.calorias
       */
    }
    method tieneRutinaConMenosDeCkal(cantidad){
        const caloriasDeRutinas = rutinas.map({rutina => rutina.conteoCkal()})
        caloriasDeRutinas.any({calorias => calorias < cantidad})
    }


}
