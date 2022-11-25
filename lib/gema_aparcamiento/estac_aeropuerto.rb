module GemaAparcamiento

    class EstacAeropuerto < GemaAparcamiento::Datos
        include Comparable
        include Enumerable
        attr_reader :n_plantas
        def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, distancia, plazas_minusvalidos,plazas_minusvalidos_ocupadas, precio_x_minuto, cjto_vehiculos, n_plantas)
            if !(n_plantas.is_a? Integer) or n_plantas < 0
                raise ArgumentError.new("El n_plantas debe ser un int positivo")    
            end
            if n_plantas > plazas
                raise ArgumentError.new("El n_plantas debe ser < que le n_plazas totales")
            end
            super(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, distancia, plazas_minusvalidos,plazas_minusvalidos_ocupadas, precio_x_minuto, cjto_vehiculos)
            @n_plantas = n_plantas
        end

        def to_s
            s = ""
            s << super.to_s
            s << " Corresponde a un estacionamiento de aeropuerto que tiene #{@n_plantas} plantas."
        end        
    end

end