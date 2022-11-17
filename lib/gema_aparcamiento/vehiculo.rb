module GemaAparcamiento
    # = Clase Vehiculo
    class Vehiculo
        include Comparable
        attr_reader :id, :altura, :anchura, :largo, :peso
        # == Initialize de la clase vehiculo
        def initialize(id, altura, anchura, largo, peso) # :yields: id, altura, anchura, largo, peso
            #Excepciones para id
            if !(id.is_a? Integer) or id < 0
                raise ArgumentError.new("El valor del id debe ser un int positivo")
            end
            #Excepciones para altura
            if !(altura.is_a? Numeric) or altura < 0
                raise ArgumentError.new("El valor de la altura debe ser un Numeric positivo")
            end
            #Excepciones para anchura
            if !(anchura.is_a? Numeric) or anchura < 0
                raise ArgumentError.new("El valor de la anchura debe ser un Numeric positivo")
            end
            #Excepciones para largo
            if !(largo.is_a? Numeric) or largo < 0
                raise ArgumentError.new("El valor del largo debe ser un Numeric positivo")
            end
            #Excepciones para peso
            if !(peso.is_a? Numeric) or peso < 0
                raise ArgumentError.new("El peso debe ser un Numeric positivo")
            end

            @id = id
            @altura, @anchura, @largo, @peso = altura, anchura, largo, peso

            if defined?(@@numero_vehiculos)
                @@numero_vehiculos += 1
              else
                @@numero_vehiculos = 1
            end

        end
        # Este método initialize de la clase *Vehiculo* recibe los parámetros que serán *variables de instancia* de la clase
        # En la implementación del método hay condicionales para comprobar que los parámetros que se pasan son correctos.
        # En otro caso se lanzarán excepciones.


        # == Método para mostrar los datos del vehiculo por pantalla
        def to_s()
            "Vehiculo con id #{@id}, altura #{@altura} m, anchura #{@anchura} m, largo #{@largo} m y un peso de #{@peso} kg"
        end
        # == Método que se usará para obtener la variable de clase
        def self.count()
            @@numero_vehiculos
        end
        # == Sobrecrga de los operadores de comparación
        def <=>(other) # :yields: other
            return nil unless other.instance_of?GemaAparcamiento::Vehiculo
                
            self.anchura * self.altura * self.largo <=> other.anchura * other.altura * other.largo
        end

        ORIGIN = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
    end

end