module GemaAparcamiento

  # = Clase Datos
  class Datos
    attr_reader :accesibilidad, :seguridad, :id, :nombre_comercial, :descripcion, :tipo_aparcamiento, :distancia, :plazas_minusvalidos, :precio_x_minuto, :cjto_vehiculos, :plazas_minusvalidos_ocupadas, :plazas_ap
    # == Initialize de la clase Datos
    def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas_ap, distancia, plazas_minusvalidos, plazas_minusvalidos_ocupadas, precio_x_minuto, cjto_vehiculos)
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
      if !(tipo_aparcamiento.is_a? String) or (not(tipo_aparcamiento == "autobuses") and !(tipo_aparcamiento == "coches") and !(tipo_aparcamiento == "motos") and !(tipo_aparcamiento == "bicicletas") and !(tipo_aparcamiento == "minusvalido"))
        raise ArgumentError.new("El tipo_aparcamiento debe ser un string (autobuses, coches, motos, bicicletas)")
      end
      #Excepciones para plazas
      if !(plazas_ap.is_a? Integer) or plazas_ap < 0
        raise ArgumentError.new("El valor de plazas debe ser un int positivo")
      end     
      #Excepciones para plazas_minusvalidos
      if !(plazas_minusvalidos.is_a? Integer) or plazas_minusvalidos < 0
        raise ArgumentError.new("El valor de plazas_minusvalidos debe ser un int positivo")
      end
      if (plazas_minusvalidos > plazas_ap) 
        raise ArgumentError.new("Las plazas de minusválidos deben ser < que el n_plazas totales")
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
      if cjto_vehiculos.size > plazas_ap
        raise ArgumentError.new("El conjunto de vehiculos debe ser menor que el numero de plazas y mayor o igual a 0")
      end
      #Excepciones para plazas_minusvalidos_ocupadas
      if !(plazas_minusvalidos_ocupadas.is_a? Integer) or plazas_minusvalidos_ocupadas < 0
        raise ArgumentError.new("El valor de plazas_minusvalidos_ocupadas debe ser un int positivo")
      end
      if (plazas_minusvalidos_ocupadas > plazas_minusvalidos) or (plazas_minusvalidos_ocupadas > plazas_ap) or (plazas_minusvalidos_ocupadas > cjto_vehiculos.size)
        raise ArgumentError.new("Las plazas de minusválidos ocupadas deben ser < que las plazas de minusválidos totales y las plazas totales en general")
      end             
      #Inicializando las valiables de instancia
      @accesibilidad, @seguridad, @id = accesibilidad, seguridad, id
      @nombre_comercial, @descripcion, @tipo_aparcamiento = nombre_comercial, descripcion, tipo_aparcamiento
      @plazas_ap = plazas_ap
      @plazas_minusvalidos = plazas_minusvalidos
      @distancia, @precio_x_minuto = distancia, precio_x_minuto
      @cjto_vehiculos = cjto_vehiculos
      @plazas_minusvalidos_ocupadas = plazas_minusvalidos_ocupadas

      #Constantes con las medidas de los aparcamientos según el tipo de aparcamiento
      case tipo_aparcamiento
        when tipo_aparcamiento == "autobuses" then @AUTOBUS = [3, 10, 3]
        when tipo_aparcamiento == "coches" then @COCHE = [2, 3.5, 2]
        when tipo_aparcamiento == "motos" then @MOTO = [2, 2, 2]
        when tipo_aparcamiento == "bicicletas" then @BICICLETA = [2, 1.5, 1.5]
        when tipo_aparcamiento == "minusvalido" then @MINUSVALIDO = [5, 2, 5, 1.5]
      end
    end
    # ===Este método initialize de la clase *Datos* recibe los parámetros que serán *variables de instancia* de la clase
    # ===En la implementación del método hay condicionales para comprobar que los parámetros que se pasan son correctos.
    # ===En otro caso se lanzarán excepciones.

    # == Método para obtener el número de plazas ocupadas
    def get_plazas_ocupadas()
      @cjto_vehiculos.size
    end
    # == Método para obtener el número de plazas totales
    def get_plazas_totales()
      @plazas_ap
    end
    # == Método para obtener el número de plazas libres
    def plazas_libres()
      @plazas_ap - self.get_plazas_ocupadas
    end
    # == Método para mostrar los datos del aparcamiento por pantalla
    def to_s()
      "Aparcamiento con accesibilidad #{@accesibilidad}, seguridad #{@seguridad} e id #{@id}. Establecimiento en #{@nombre_comercial}, #{@descripcion} y del tipo #{@tipo_aparcamiento}. Plazas totales #{@plazas_ap}. Estacionamiento a #{@distancia} km del centro de la ciudad, tiene #{@plazas_minusvalidos} plazas para minusválidos. Precio por minuto #{@precio_x_minuto} € y tiene #{@cjto_vehiculos.size} vehiculos."
    end
    # == Método para obtener el número de plazas para minusválidos libres
    def get_plazas_minusvalidos_libres
      @plazas_minusvalidos - @plazas_minusvalidos_ocupadas
    end  
    # == Método para aparcar un vehiculo
    def insertar_vehiculo(other) # :yields: other
      if !(other.is_a?GemaAparcamiento::Vehiculo)
        raise ArgumentError.new("El objeto a insertar debe ser un vehiculo")

      elsif GemaAparcamiento::Funcionalidades.estado_de_aparcamiento(self) == GemaAparcamiento::Funcionalidades::APAR_LLENO
        raise ArgumentError.new("No se pueden insertar más vehiculos, estacionamiento lleno")
      end

      self.cjto_vehiculos.push(other)
    end


    # == Método para calcular la duración
    def duracion_vehiculo(entrada, salida)# :yields: entrada, salida
      if !(salida.is_a? Time) or !(entrada.is_a? Time)
        raise ArgumentError.new("Entrada y salida deben ser un objeto time")
      end
      if salida < entrada
        raise ArgumentError.new("La hora de salida debe ser mayor que la hora de entrada")
      end
      min = salida.min - entrada.min
      hora = salida.hour - entrada.hour

      return "La duracion en el estacionamiento fue de #{hora} horas y #{min} minutos"
    end

    # == Método para calcular el importe a pagar
    def importe_pagar(t_entrada, t_salida)# :yields: t_entrada, t_salida
      if !(t_salida.is_a? Time) or !(t_entrada.is_a? Time)
        raise ArgumentError.new("Entrada y salida deben ser un objeto time")
      end
      if t_salida < t_entrada
        raise ArgumentError.new("La hora de salida debe ser mayor que la hora de entrada")
      end
      min = t_salida.min - t_entrada.min
      hora_en_min = t_salida.hour - t_entrada.hour

      (self.precio_x_minuto * (min + (hora_en_min * 60)))
      
    end
  end
end
