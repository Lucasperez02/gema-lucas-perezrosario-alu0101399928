RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacAeropuerto do
        before (:each) do
            @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
            @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
            @estac_tren1 = GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],3)
        end
        
        it "Expectativas del initialize de EstacAeropuerto" do
            expect(GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],3)).not_to eq(nil)
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], -3)}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], "3")}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], 32)}.to raise_error(ArgumentError) #El n_plantas debe ser < que le n_plazas totales
        end
        it "Expectativas del getter" do
            expect(@estac_tren1.plazas_minusvalidos).to eq(5)
            expect(@estac_tren1.distancia).to eq(2)
            expect(@estac_tren1.precio_x_minuto).to eq(0.5)
            expect(@estac_tren1.n_plantas).to eq(3)
            expect(@estac_tren1.cjto_vehiculos).to eq([@veh1_1, @veh2_2, @veh1_1, @veh2_2])
        end
    
        it "Expectativas del to_s" do
            expect(@estac_tren1.to_s()).to eq("Aparcamiento con accesibilidad 1, seguridad 10 e id 12345. Establecimiento en Mercadona, Mixto y del tipo coches. Plazas totales 30.Estacionamiento a 2 km del centro de la ciudad, tiene 5 plazas para minusválidos. Precio por minuto 0.5 € y tiene 4 vehiculos. Corresponde a un estacionamiento de aeropuerto que tiene 3 plantas.")
        end        
    end


end