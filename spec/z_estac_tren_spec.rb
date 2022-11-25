RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacTren do
        before (:each) do
            @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
            @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
            @estac_tren1 = GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],8)
            @estac_tren2 = GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 25, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],8)
            @estac_tren3 = GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],8)
            @t_entrada = Time.new(2022, 11, 25, 9, 0)
            @t_salida = Time.new(2022, 11, 25, 11, 15)
            @t_salida2 = Time.new(2022, 11, 25, 9, 45)
            @sum = 0            
        end
        it "Expectativas del initialize de EstacTren" do
            expect(GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],8)).not_to eq(nil)
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], -8)}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser un int positivo
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], "8")}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser un int positivo
            expect{GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], 32)}.to raise_error(ArgumentError) #El plazas_larga_estancia debe ser < que le n_plazas totales
        end
        it "Expectativas del getter" do
            expect(@estac_tren1.plazas_minusvalidos).to eq(5) 
            expect(@estac_tren1.distancia).to eq(2)
            expect(@estac_tren1.precio_x_minuto).to eq(0.5)
            expect(@estac_tren1.plazas_larga_estancia).to eq(8)
            expect(@estac_tren1.cjto_vehiculos).to eq([@veh1_1, @veh2_2, @veh1_1, @veh2_2]) 
        end
        

        it "Expectativas del to_s" do
            expect(@estac_tren1.to_s()).to eq("Aparcamiento con accesibilidad 1, seguridad 10 e id 12345. Establecimiento en Mercadona, Mixto y del tipo coches. Plazas totales 20. Estacionamiento a 2 km del centro de la ciudad, tiene 5 plazas para minusválidos. Precio por minuto 0.5 € y tiene 4 vehiculos. Corresponde a un estacionamiento de tren que tiene 8 plazas de larga estancia.")

        end
    
        it "Probando insertar vehiculo en estacionameinto de tren" do
            expect(@estac_tren1.get_plazas_ocupadas).to eq(4)     
            @estac_tren1.insertar_vehiculo(@veh1_1)
            expect(@estac_tren1.get_plazas_ocupadas).to eq(5)
        end

        it "Probando función para determinar la duración en estacionamiento de tren" do 
            expect(@estac_tren1.duracion_vehiculo(@t_entrada, @t_salida)).to eq("La duracion en el estacionamiento fue de 2 horas y 15 minutos")
            expect{@estac_tren1.duracion_vehiculo(@t_salida, @t_entrada)}.to raise_error(ArgumentError) #La hora de salida debe ser mayor que la de entrada
            expect{@estac_tren1.duracion_vehiculo(1, @t_entrada)}.to raise_error(ArgumentError) #Entrada y salida deben ser un objeto time
        end
        it "Probando la función de calcular el importe a pagar para estacionamiento tren" do
            expect(@estac_tren1.importe_pagar(@t_entrada, @t_salida)).to eq(67.5)
            expect(@estac_tren1.importe_pagar(@t_entrada, @t_salida2)).to eq(22.5)
            expect{@estac_tren1.importe_pagar(@t_salida, @t_entrada)}.to raise_error(ArgumentError)
        end
        

        it "Comparable en la clase estacionamiento tren" do
            expect(@estac_tren1 > @estac_tren2).to eq(false)
            expect(@estac_tren1 < @estac_tren2).to eq(true)
            expect(@estac_tren1 == @estac_tren3).to eq(true)
            expect(@estac_tren1 != @estac_tren2).to eq(true)
            expect(@estac_tren3.between?(@estac_tren1, @estac_tren2)).to eq(true)
        end

        it "Probando Enumereable en vehiculo" do
            expect(@estac_tren1.each{|elemento| @sum = @sum + 1}).to eq(4)
            expect(@estac_tren1.max).to eq(20)
            expect(@estac_tren1.sort).to eq([1,5,8,20])
            expect(@estac_tren1.min).to eq(1)
            expect(@estac_tren1.select{|i| i.between?(1,8)}).to eq([5, 1,8]) 
        end      

    end


end