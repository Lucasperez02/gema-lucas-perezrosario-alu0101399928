module GemaAparcamiento

    class Motor < GemaAparcamiento::Vehiculo
        include Comparable
        attr_reader :n_ruedas, :n_plazas, :potencia_motor, :vel_maxima
        

    end

end