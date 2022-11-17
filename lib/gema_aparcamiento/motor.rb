module GemaAparcamiento

    class Motor < GemaAparcamiento::Vehiculo
        include Comparable
        attr_reader :n_ruedas, :n_plazas, :potencia_motor, :vel_maxima
        def initialize(id, altura, anchura, largo, peso,n_ruedas, n_plazas, potencia_motor, vel_maxima)

            if !(n_ruedas.is_a? Integer) or n_ruedas < 0
                raise ArgumentError.new("El n_ruedas debe ser un int positivo")
            end
            if !(n_plazas.is_a? Integer) or n_plazas < 0
                raise ArgumentError.new("El n_plazas debe ser un int positivo")
            end
            if !(potencia_motor.is_a? Integer) or potencia_motor < 0
                raise ArgumentError.new("La potencia_motor debe ser un int positivo")
            end
            if !(vel_maxima.is_a? Integer) or vel_maxima < 0
                raise ArgumentError.new("La vel_maxima debe ser un int positivo")
            end
            super(id, altura, anchura, largo, peso)
            @n_ruedas, @n_plazas = n_ruedas, n_plazas
            @potencia_motor, @vel_maxima = potencia_motor, vel_maxima
        end

        def to_s
            s = ""
            s << super.to_s
            s <<". Vehiculo a motor de #{@n_ruedas} ruedas, #{@n_plazas} plazas, potencia de motor de #{@potencia_motor} cc y máximo #{@vel_maxima} km hora"
            s
        end
    end

end