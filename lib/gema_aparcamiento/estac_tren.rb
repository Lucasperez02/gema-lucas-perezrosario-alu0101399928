module GemaAparcamiento

    # = Clase Estacionamiento de Tren
    class EstacTren < GemaAparcamiento::Datos
        include Comparable
        include Enumerable
        attr_reader :plazas_larga_estancia
        # == Initialize para la clase EstacTren  
        def initialize(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas_ap, distancia, plazas_minusvalidos,plazas_minusvalidos_ocupadas, precio_x_minuto, cjto_vehiculos, plazas_larga_estancia)
            if !(plazas_larga_estancia.is_a? Integer) or plazas_larga_estancia < 0
                raise ArgumentError.new("El plazas_larga_estancia debe ser un int positivo")    
            end
            if plazas_larga_estancia > plazas_ap
                raise ArgumentError.new("El plazas_larga_estancia debe ser < que le n_plazas totales")
            end
            super(accesibilidad, seguridad, id, nombre_comercial, descripcion, tipo_aparcamiento, plazas_ap, distancia, plazas_minusvalidos,plazas_minusvalidos_ocupadas, precio_x_minuto, cjto_vehiculos)
            @plazas_larga_estancia = plazas_larga_estancia
        end
        # == Método para mostrar los datos del Estacionamiento de tren por pantalla
        def to_s
            s = ""
            s << super.to_s
            s << " Corresponde a un estacionamiento de tren que tiene #{@plazas_larga_estancia} plazas de larga estancia."
        end
        # == Método para uso de comparable
        def <=>(other)
            return nil unless other.instance_of?GemaAparcamiento::EstacTren
                
            self.plazas_ap <=> other.plazas_ap
        end
        # == Método para uso de enumerable
        def each
            yield @plazas_ap
            yield @plazas_minusvalidos
            yield @plazas_minusvalidos_ocupadas
            yield @plazas_larga_estancia
        end
        
    end

end

