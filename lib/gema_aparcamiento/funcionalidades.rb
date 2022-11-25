module GemaAparcamiento

    module Funcionalidades
        #Constantes para el estado del aparcamiento
        APAR_LLENO = "Lleno"
        APAR_LIBRE = "Libre"

        def Funcionalidades.estado_de_aparcamiento (aparcamiento)
            #Excepción para comprobar que el objeto que se pasa es un Datos
            if !(aparcamiento.is_a? GemaAparcamiento::Datos)
                raise ArgumentError.new("El objeto debe ser de la clase Dato")
            end
            if aparcamiento.plazas_libres == 0
                APAR_LLENO
            else
                APAR_LIBRE
            end
        end

        def Funcionalidades.cumple_plazas_minusvalidos (aparcamiento)
            if !(aparcamiento.is_a? GemaAparcamiento::Datos)
                raise ArgumentError.new("El objeto debe ser de la clase Dato")
            end
            if (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) >= (1.0/40.0)
                return true
            elsif (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) < (1.0/40.0)
                return false
            end
        end
  
    end
  
end
  