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
            if aparcamiento.plazas_ap < 40
                return true
            end    
            if (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) >= (1.0/40.0)
                return true
            elsif (aparcamiento.plazas_minusvalidos.to_f/aparcamiento.plazas_ap.to_f) < (1.0/40.0)
                return false
            end
        end

        def Funcionalidades.plazas_minus_libres_aparc (aparcamiento)
            aparcamiento.get_plazas_minusvalidos_libres
        end

        def Funcionalidades.vehiculos_estacionados (aparcamiento)
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

        #Programación Funcional

        def Funcionalidades.porcentaje_de_ocupacion (aparcamiento) 
            (aparcamiento.cjto_vehiculos.size.to_f / aparcamiento.plazas_ap.to_f) * 100.0
        end

        def Funcionalidades.procentaje_plazas_minus_libres (aparcamiento)
            (aparcamiento.get_plazas_minusvalidos_libres.to_f / aparcamiento.plazas_minusvalidos.to_f) * 100.0
        end
        

    end
  
end
  