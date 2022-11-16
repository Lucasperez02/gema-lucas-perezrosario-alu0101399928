module GemaAparcamiento

    class Vehiculo
        include Comparable
        attr_reader :id, :altura, :anchura, :largo, :peso
    end

end