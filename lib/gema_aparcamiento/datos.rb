module GemaAparcamiento

  class Datos
    attr_reader :accesibilidad, :seguridad, :id, :nombre_comercial, :descripcion, :tipo_aparcamiento, :plazas_ocupadas
    def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, plazas_ocupadas, distancia, plazas_minusvalidos, precio_x_minuto, cjto_vehiculos)
      #Excepciones para accesibilidad
      if !(accesibilidad.is_a? Integer) or accesibilidad < 0
        raise ArgumentError.new("El valor de accesibilidad debe ser un int positivo")
      end
      if accesibilidad < 1 or accesibilidad > 5
        raise ArgumentError.new("El valor de accesibilidad debe estar entre 1 - 5")
      end 
      #Excepciones para seguridad
      if !(seguridad.is_a? Integer) or seguridad < 0
        raise ArgumentError.new("El valor de seguridad debe ser un int positivo")
      end
      if seguridad < 1 or seguridad > 10
        raise ArgumentError.new("El valor de seguridad debe estar entre 1 - 10)")
      end 
      #Excepciones para id
      if !(id.is_a? Integer) or id < 0
        raise ArgumentError.new("El valor de id debe ser un int positivo")
      end     
      #Excepciones para nombre_comercial
      if !(nombre_comercial.is_a? String)
        raise ArgumentError.new("El valor de nombre_comercial debe ser una string")
      end
      #Excepciones para descripcion
      if !(descripcion.is_a? String) or (not(descripcion == "Mixto") and !(descripcion == "Cubierto") and !(descripcion == "Aire libre"))
        raise ArgumentError.new("El valor de descripcion debe ser un string (Mixto, Cubierto, Aire libre)")
      end
      #Excepciones para tipo_aparcamiento
      if !(tipo_aparcamiento.is_a? String) or (not(tipo_aparcamiento == "autobuses") and !(tipo_aparcamiento == "coches") and !(tipo_aparcamiento == "motos") and !(tipo_aparcamiento == "bicicletas"))
        raise ArgumentError.new("El tipo_aparcamiento debe ser un string (autobuses, coches, motos, bicicletas)")
      end
      #Excepciones para plazas
      if !(plazas.is_a? Integer) or plazas < 0
        raise ArgumentError.new("El valor de plazas debe ser un int positivo")
      end     
      #Excepciones para plazas_ocupadas
      if !(plazas_ocupadas.is_a? Integer) or plazas_ocupadas <= 0
        raise ArgumentError.new("El valor de plazas_ocupadas debe ser un int positivo")
      end
      if plazas_ocupadas > plazas
        raise ArgumentError.new("El númeor de plazas ocupadas debe ser menor que las plazas totales")
      end
      #Excepciones para plazas_minusvalidos
      if !(plazas_minusvalidos.is_a? Integer) or plazas_minusvalidos <= 0
        raise ArgumentError.new("El valor de plazas_minusvalidos debe ser un int positivo")
      end
      #Excepciones para distancia
      if !(distancia.is_a? Numeric) or distancia < 0
        raise ArgumentError.new("El valor de distancia debe ser un numeric positivo")
      end
      #Excepciones para precio_x_minuto
      if !(precio_x_minuto.is_a? Numeric) or precio_x_minuto < 0
        raise ArgumentError.new("El valor de precio_x_minuto debe ser un numeric positivo")
      end
      #Excepciones para cjto_vehiculos
      if !(cjto_vehiculos[0].is_a? GemaAparcamiento::Vehiculo) or !(cjto_vehiculos.is_a? Array)
        raise ArgumentError.new("El cjto_vehiculos debe ser un array de vehiculos")
      end
      if (plazas_minusvalidos > plazas) 
        raise ArgumentError.new("Las plazas de minusválidos deben ser < que el n_plazas totales")
      end
      #Excepciones para accesibilidad              
      #Inicializando las valiables de instancia
      @accesibilidad, @seguridad, @id = accesibilidad, seguridad, id
      @nombre_comercial, @descripcion, @tipo_aparcamiento = nombre_comercial, descripcion, tipo_aparcamiento
      @plazas, @plazas_ocupadas = plazas, plazas_ocupadas
      @plazas_minusvalidos = plazas_minusvalidos
      @distancia, @precio_x_minuto = distancia, precio_x_minuto
      @cjto_vehiculos = cjto_vehiculos

      #Constantes con las medidas de los aparcamientos según el tipo de aparcamiento
      case tipo_aparcamiento
        when tipo_aparcamiento == "autobuses" then @AUTOBUS = [3, 10, 3]
        when tipo_aparcamiento == "coches" then @COCHE = [2, 3.5, 2]
        when tipo_aparcamiento == "motos" then @MOTO = [2, 2, 2]
        when tipo_aparcamiento == "bicicletas" then @BICICLETA = [2, 1.5, 1.5]
      end
    end

    #Método para obtener el número de plazas totales
    def get_plazas_totales()
      @plazas
    end
    #Método para obtener el número de plazas libres
    def plazas_libres()
      @plazas - @plazas_ocupadas
    end
    #Método para mostrar los datos del aparcamiento por pantalla
    def to_s()
      "Aparcamiento con accesibilidad #{@accesibilidad}, seguridad #{@seguridad} e id #{@id}. Establecimiento en #{@nombre_comercial}, #{@descripcion} y del tipo #{@tipo_aparcamiento}. Plazas totales #{@plazas} y #{@plazas_ocupadas} ocupadas"
    end  

  end

end
