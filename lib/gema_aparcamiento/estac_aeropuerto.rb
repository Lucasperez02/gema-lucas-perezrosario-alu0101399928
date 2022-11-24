module GemaAparcamiento

    class EstacAeropuerto < GemaAparcamiento::Datos  
        def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, plazas_ocupadas, distancia, plazas_minusvalidos, precio_x_minuto, cjto_vehiculos, n_plantas)
            if !(n_plantas.is_a? Integer) or n_plantas < 0
                raise ArgumentError.new("El n_plantas debe ser un int positivo")    
            end
            if n_plantas > plazas
                raise ArgumentError.new("El n_plantas debe ser < que le n_plazas totales")
            end
            super(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, plazas_ocupadas, distancia, plazas_minusvalidos, precio_x_minuto, cjto_vehiculos)
            @n_plantas = n_plantas
        end
        
    end

end