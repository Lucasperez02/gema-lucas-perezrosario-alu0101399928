RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::EstacAeropuerto do
        before (:each) do
            @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
            @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
            @estac_aeropuerto1 = GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],3)
            @estac_aeropuerto2 = GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 25, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],10)
            @estac_aeropuerto3 = GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],10)
            @t_entrada = Time.new(2022, 11, 25, 9, 0)
            @t_salida = Time.new(2022, 11, 25, 11, 15)
            @t_salida2 = Time.new(2022, 11, 25, 9, 45)
            @sum = 0
        end
        
        it "Expectativas del initialize de EstacAeropuerto" do
            expect(GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],3)).not_to eq(nil)
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], -3)}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], "3")}.to raise_error(ArgumentError) #El n_plantas debe ser un int positivo
            expect{GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2], 32)}.to raise_error(ArgumentError) #El n_plantas debe ser < que le n_plazas totales
        end
        it "Expectativas del getter" do
            expect(@estac_aeropuerto1.plazas_minusvalidos).to eq(5)
            expect(@estac_aeropuerto1.distancia).to eq(2)
            expect(@estac_aeropuerto1.precio_x_minuto).to eq(0.5)
            expect(@estac_aeropuerto1.n_plantas).to eq(3)
            expect(@estac_aeropuerto1.cjto_vehiculos).to eq([@veh1_1, @veh2_2, @veh1_1, @veh2_2])
        end

        it "Expectativas del to_s" do
            expect(@estac_aeropuerto1.to_s()).to eq("Aparcamiento con accesibilidad 1, seguridad 10 e id 12345. Establecimiento en Mercadona, Mixto y del tipo coches. Plazas totales 20. Estacionamiento a 2 km del centro de la ciudad, tiene 5 plazas para minusválidos. Precio por minuto 0.5 € y tiene 4 vehiculos. Corresponde a un estacionamiento de aeropuerto que tiene 3 plantas.")
        end
        
        it "Probando insertar vehiculo en estacionamiento de aeropuerto" do
            expect(@estac_aeropuerto1.get_plazas_ocupadas).to eq(4)     
            @estac_aeropuerto1.insertar_vehiculo(@veh1_1)
            expect(@estac_aeropuerto1.get_plazas_ocupadas).to eq(5)
        end

        it "Probando función para determinar la duración en estacionamiento de tren" do 
            expect(@estac_aeropuerto1.duracion_vehiculo(@t_entrada, @t_salida)).to eq("La duracion en el estacionamiento fue de 2 horas y 15 minutos")
            expect{@estac_aeropuerto1.duracion_vehiculo(@t_salida, @t_entrada)}.to raise_error(ArgumentError) #La hora de salida debe ser mayor que la de entrada
            expect{@estac_aeropuerto1.duracion_vehiculo(3, @t_entrada)}.to raise_error(ArgumentError) #Entrada y salida deben ser un objeto time
  
        end

        it "Probando la función de calcular el importe a pagar para estacionamiento aeropuerto" do
            expect(@estac_aeropuerto1.importe_pagar(@t_entrada, @t_salida)).to eq(67.5)
            expect(@estac_aeropuerto1.importe_pagar(@t_entrada, @t_salida2)).to eq(22.5)
            expect{@estac_aeropuerto1.importe_pagar(@t_salida, @t_entrada)}.to raise_error(ArgumentError)
        end
        
        it "Comparable en la clase estacionamiento aeropuerto" do
            expect(@estac_aeropuerto1 > @estac_aeropuerto2).to eq(false)
            expect(@estac_aeropuerto1 < @estac_aeropuerto2).to eq(true)
            expect(@estac_aeropuerto1 == @estac_aeropuerto3).to eq(true)
            expect(@estac_aeropuerto1 != @estac_aeropuerto2).to eq(true)
            expect(@estac_aeropuerto3.between?(@estac_aeropuerto1, @estac_aeropuerto2)).to eq(true)
        end


        it "Probando Enumereable en vehiculo" do
            expect(@estac_aeropuerto1.each{|elemento| @sum = @sum + 1}).to eq(4)
            expect(@estac_aeropuerto1.max).to eq(20)
            expect(@estac_aeropuerto1.sort).to eq([1,3,5,20])
            expect(@estac_aeropuerto1.min).to eq(1)
            expect(@estac_aeropuerto1.select{|i| i.between?(1,4)}).to eq([1, 3]) 
        end        

        it "Jerarquía de herencia en EstacAeropuerto" do
            expect(@estac_aeropuerto1.instance_of? GemaAparcamiento::EstacAeropuerto).to eq(true)
            expect(@estac_aeropuerto1.instance_of? GemaAparcamiento::EstacTren).to eq(false)
            expect(@estac_aeropuerto1.instance_of? GemaAparcamiento::Datos).to eq(false)
            expect(@estac_aeropuerto1.is_a? GemaAparcamiento::Datos).to eq(true)
            expect(@estac_aeropuerto1.is_a? Object).to eq(true)
            expect(@estac_aeropuerto1.is_a? BasicObject).to eq(true)
            expect(@estac_aeropuerto1.instance_of? GemaAparcamiento::Vehiculo).to eq(false)
            expect(@estac_aeropuerto1.instance_of? GemaAparcamiento::Motor).to eq(false)
            expect(@estac_aeropuerto1.instance_of? Numeric).to eq(false)
            expect(@estac_aeropuerto1.instance_of? String).to eq(false)           
        end
        
    end


end