RSpec.describe GemaAparcamiento do
 
    describe GemaAparcamiento::Datos do
        before (:all) do
          @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
          @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)      
          @apar1 = GemaAparcamiento::Datos.new(3, 8, 23414, "Carrefour", "Mixto", "coches", 200, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2, @veh1_1, @veh2_2])
          @apar2 = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 20, 2, 5, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2])
          @apar3 = GemaAparcamiento::Datos.new(3, 10, 13452,"Carrefour", "Mixto", "coches", 4, 2, 1, 0.5,[@veh1_1, @veh2_2, @veh1_1, @veh2_2])
          @t_entrada = Time.new(2022, 11, 25, 9, 0)
          @t_salida = Time.new(2022, 11, 25, 11, 15)
          @t_salida2 = Time.new(2022, 11, 25, 9, 45)
        end
    
        it "Instancia de un aparcamiento" do
          expect(GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])).not_to eq(nil)
          expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de accesibilidad debe ser un int positivo
          expect{GemaAparcamiento::Datos.new(7, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de accesibilidad debe estar entre 1 - 5
    
          expect{GemaAparcamiento::Datos.new(1, -1, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de seguridad debe ser un int positivo
          expect{GemaAparcamiento::Datos.new(1, 11, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de seguridad debe estar entre 1 - 10)
    
          expect{GemaAparcamiento::Datos.new(1, 10, -12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo   
          expect{GemaAparcamiento::Datos.new(1, 10, "12345", "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, 4, "Mixto", "Coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de nombre_comercial debe ser una string
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Otro", "coches", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de descripcion debe ser un string (Mixto, Cubierto, Aire libre)
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "camiones", 30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de tipo_aparcamiento debe ser un string (Mixto, )
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", -30, 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de plazas debe ser un int > 0
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", "20", 2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de plazas debe ser un int > 0
    
    
          
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, -2, 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de distancia debe ser un numeric positivo
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, "2", 5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de distancia debe ser un numeric positivo
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, -5, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de plazas_minusvalidos debe ser un int positivo
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, "5", 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de plazas_minusvalidos debe ser un int positivo
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 32, 0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #Las plazas de minusválidos deben ser < que el n_plazas totales
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, -0.5, [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de precio_x_minuto debe ser un numeric positivo
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, "0.5", [@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El valor de precio_x_minuto debe ser un numeric positivo
    
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, 3)}.to raise_error(ArgumentError) #El cjto_vehiculos debe ser un array de vehiculos
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 2, 5, 0.5, [1, @veh2_2])}.to raise_error(ArgumentError) #El cjto_vehiculos debe ser un array de vehiculos
          expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 4, 2, 5, 0.5, [@veh1_1, @veh2_2,@veh1_1, @veh2_2,@veh1_1, @veh2_2])}.to raise_error(ArgumentError) #El cjto_vehiculos debe ser menos que el numero de plazas
    
        end
    
    
        it "Probando la función para obtener el número de plazas del aparcamiento" do
          expect(@apar1.get_plazas_totales()).to eq(200)
          expect(@apar2.get_plazas_totales()).to eq(20)
        end
    
        it "Probanod método para devolver el número de plazas libres" do
          expect(@apar1.plazas_libres()).to eq(194)
          expect(@apar2.plazas_libres()).to eq(16) 
        end
        
        it "Probando el get_plazas_ocupadas" do
          expect(@apar1.get_plazas_ocupadas).to eq(6)     
        end 
    
        it "Probando función to_s" do
          expect(@apar1.to_s()).to eq("Aparcamiento con accesibilidad 3, seguridad 8 e id 23414. Establecimiento en Carrefour, Mixto y del tipo coches. Plazas totales 200. Estacionamiento a 2 km del centro de la ciudad, tiene 5 plazas para minusválidos. Precio por minuto 0.5 € y tiene 6 vehiculos.")
          expect(@apar2.to_s()).to eq("Aparcamiento con accesibilidad 4, seguridad 10 e id 43961. Establecimiento en HiperDino, Cubierto y del tipo motos. Plazas totales 20. Estacionamiento a 2 km del centro de la ciudad, tiene 5 plazas para minusválidos. Precio por minuto 0.5 € y tiene 4 vehiculos.")
        end
    
        it "Probando la función intertar_vehiculo" do
          expect(@apar1.get_plazas_ocupadas).to eq(6)     
          @apar1.insertar_vehiculo(@veh1_1)
          expect(@apar1.get_plazas_ocupadas).to eq(7)
          expect{@apar1.insertar_vehiculo(1)}.to raise_error(ArgumentError) #El objeto a insertar debe ser un vehiculo
          expect{@apar3.insertar_vehiculo(@veh2_2)}.to raise_error(ArgumentError) #No se pueden insertar más vehiculos, estacionamiento lleno
        end

        it "Probando función para determinar la duración" do 
          expect(@apar1.duracion_vehiculo(@t_entrada, @t_salida)).to eq("La duracion en el estacionamiento fue de 2 horas y 15 minutos")
          expect{@apar1.duracion_vehiculo(@t_salida, @t_entrada)}.to raise_error(ArgumentError) #La hora de salida debe ser mayor que la de entrada
          expect{@apar1.duracion_vehiculo(1, @t_entrada)}.to raise_error(ArgumentError) #Entrada y salida deben ser un objeto time

        end
    
        it "Probando la función de calcular el importe a pagar" do

          expect(@apar1.importe_pagar(@t_entrada, @t_salida)).to eq(67.5)
          expect(@apar1.importe_pagar(@t_entrada, @t_salida2)).to eq(22.5)
          expect{@apar1.importe_pagar(@t_salida, @t_entrada)}.to raise_error(ArgumentError)
        end
       
        it "Jerarquía de herencia de Datos" do
          expect(@apar1.instance_of? GemaAparcamiento::Datos).to eq(true)
          expect(@apar1.is_a? Object).to eq(true)
          expect(@apar1.is_a? BasicObject).to eq(true)
          expect(@apar1.instance_of? GemaAparcamiento::Vehiculo).to eq(false)
          expect(@apar1.instance_of? GemaAparcamiento::Motor).to eq(false)      
        end
      end   


end