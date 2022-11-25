module GemaAparcamiento
    # = Módulo funcionalidades
    module Funcionalidades
        # == Constantes para el estado del aparcamiento
        # - APAR_LLENO = "Lleno"
        # - APAR_LIBRE = "Libre"
        APAR_LLENO = "Lleno"
        APAR_LIBRE = "Libre"

        # == Función para obtener el estado de un aparcamiento
        def Funcionalidades.estado_de_aparcamiento (aparcamiento) # :yields: aparcamiento
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

        # == Función para saber si se cumple el número de plazas para minusváludos necesarias
        def Funcionalidades.cumple_plazas_minusvalidos (aparcamiento)# :yields: aparcamiento
            if !(aparcamiento.is_a? GemaAparcamiento::Datos)
                raise ArgumentError.new("El objeto debe ser de la clase Dato")
            end
            if aparcamiento.plazas_ap < 40
                return true
            end    
            if (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) >= (1.0/40.0)
                return true
            elsif (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) < (1.0/40.0)
                return false
            end
        end

        # == Función para obtener el número de plazas para minusválidos libres
        def Funcionalidades.plazas_minus_libres_aparc (aparcamiento)# :yields: aparcamiento
            aparcamiento.get_plazas_minusvalidos_libres
        end

        # == Función para obtener el número de vehículos estacionados
        def Funcionalidades.vehiculos_estacionados (aparcamiento) # :yields: aparcamiento
            if aparcamiento.instance_of? GemaAparcamiento::Datos
                return aparcamiento.cjto_vehiculos.size
            end
            if aparcamiento.instance_of? GemaAparcamiento::EstacTren
                return "Aparcamiento de una estación de tren con #{aparcamiento.plazas_ap} plazas, de las cuales #{aparcamiento.plazas_larga_estancia} son de larga estancia. El estacionamiento tiene #{aparcamiento.cjto_vehiculos.size} vehiculos"
            end
            if aparcamiento.instance_of? GemaAparcamiento::EstacAeropuerto
                return "Aparcamiento de un aeropuerto con #{aparcamiento.plazas_ap} plazas, divididas en #{aparcamiento.n_plantas} plantas. El estacionamiento tiene #{aparcamiento.cjto_vehiculos.size} vehiculos"
            end
            return "NO es ninguno"
        end
  
    end
  
end
  