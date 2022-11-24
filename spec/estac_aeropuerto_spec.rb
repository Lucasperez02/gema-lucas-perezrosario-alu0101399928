RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacAeropuerto do
        before (:each) do
            @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
            @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
        end
        
        it "Expectativas del initialize de EstacAeropuerto" do
            expect(GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2],3)).not_to eq(nil)
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], -3)}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], "3")}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], 32)}.to raise_error(ArgumentError) #El n_plantas debe ser < que le n_plazas totales
        end
    end


end