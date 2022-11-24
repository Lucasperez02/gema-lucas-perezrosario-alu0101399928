module GemaAparcamiento

    class EstacTren < GemaAparcamiento::Datos
        attr_reader :plazas_larga_estancia  
        def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, plazas_ocupadas, distancia, plazas_minusvalidos, precio_x_minuto, cjto_vehiculos, plazas_larga_estancia)
            if !(plazas_larga_estancia.is_a? Integer) or plazas_larga_estancia < 0
                raise ArgumentError.new("El plazas_larga_estancia debe ser un int positivo")    
            end
            if plazas_larga_estancia > plazas
                raise ArgumentError.new("El plazas_larga_estancia debe ser < que le n_plazas totales")
            end
            super(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas, plazas_ocupadas, distancia, plazas_minusvalidos, precio_x_minuto, cjto_vehiculos)
            @plazas_larga_estancia = plazas_larga_estancia
        end
        
    end

end

