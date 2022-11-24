RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacTren do
        it "Expectativas del initialize de EstacTren" do
            expect(GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2],8)).not_to eq(nil)
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2]), -8}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser un int positivo
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2]), "8"}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser un int positivo
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27, 2, 5, 0.5, [@veh1_1, @veh2_2]), 32}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser < que le n_plazas totales 
        
        end
    end


end