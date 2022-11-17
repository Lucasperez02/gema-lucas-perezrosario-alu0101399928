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
  
    end
  
end
  