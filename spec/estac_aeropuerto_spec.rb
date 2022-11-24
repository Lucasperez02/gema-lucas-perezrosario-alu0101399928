RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacAeropuerto do
        before (:each) do
            @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
            @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
            @estac_tren1 = GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2],8)
        end
        
        it "Expectativas del initialize de EstacAeropuerto" do
            expect(GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2],3)).not_to eq(nil)
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], -3)}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], "3")}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2], 32)}.to raise_error(ArgumentError) #El n_plantas debe ser < que le n_plazas totales
        end
        it "Expectativas del getter" do
            expect(@estac_tren1.plazas_minusvalidos).to eq(5)
            expect(@estac_tren1.distancia).to eq(2)
            expect(@estac_tren1.precio_x_minuto).to eq(0.5)
            expect(@estac_tren1.plazas_larga_estancia).to eq(8)
            expect(@estac_tren1.cjto_vehiculos).to eq([@veh1_1, @veh2_2])
        end        
    end


end