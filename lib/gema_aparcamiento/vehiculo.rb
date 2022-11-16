module GemaAparcamiento

    class Vehiculo
        include Comparable
        attr_reader :id, :altura, :anchura, :largo, :peso
        def initialize(id, altura, anchura, largo, peso)
            #Excepciones para id
            if !(id.is_a? Integer) or id < 0
                raise ArgumentError.new("El valor del id debe ser un int positivo")
            end
            #Excepciones para altura
            if !(altura.is_a? Float) or altura < 0
                raise ArgumentError.new("El valor de la altura debe ser un float positivo")
            end
            #Excepciones para anchura
            if !(anchura.is_a? Float) or anchura < 0
                raise ArgumentError.new("El valor de la anchura debe ser un float positivo")
            end
            #Excepciones para largo
            if !(largo.is_a? Float) or largo < 0
                raise ArgumentError.new("El valor del largo debe ser un float positivo")
            end
            #Excepciones para peso
            if !(peso.is_a? Float) or peso < 0
                raise ArgumentError.new("El peso debe ser un float positivo")
            end

            @id = id
            @altura, @anchura, @largo, @peso = altura, anchura, largo, peso

            if defined?(@@numero_vehiculos)
                @@numero_vehiculos += 1
              else
                @@numero_vehiculos = 1
            end

        end

        def self.count()
            @@numero_vehiculos
        end
    end

end