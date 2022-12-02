RSpec.describe GemaAparcamiento do

    describe GemaAparcamiento::Vehiculo do
        before (:all) do
          @veh1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
          @veh2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
          @veh3 = GemaAparcamiento::Vehiculo.new(61242,2,1.45,4.3, 850)
          @sum = 0
        end
        it "Probando initialize de vehiculo" do
          expect(GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)).not_to eq(nil)
          expect{GemaAparcamiento::Vehiculo.new(-12334, 1.45, 2.0, 4.3, 700.0)}.to raise_error(ArgumentError) #El valor del id debe ser un int positivo
          expect{GemaAparcamiento::Vehiculo.new("12334", 1.45, 2.0, 4.3, 700.0)}.to raise_error(ArgumentError) #El valor del id debe ser un int positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, -1.45, 2.0, 4.3, 700.0)}.to raise_error(ArgumentError) #El valor de la altura debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, "1.45", 2.0, 4.3, 700.0)}.to raise_error(ArgumentError) #El valor de la altura debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, -2.0, 4.3, 700.0)}.to raise_error(ArgumentError) #El valor de la anchura debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, "2.0", 4.3, 700.0)}.to raise_error(ArgumentError) #El valor de la anchura debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, 2.0, -4.3, 700.0)}.to raise_error(ArgumentError) #El valor del largo debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, 2.0, "4.3", 700.0)}.to raise_error(ArgumentError) #El valor del largo anchura debe ser un numeric positivo 
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, 2.0, 4.3, -700.0)}.to raise_error(ArgumentError) #El peso debe ser un numeric positivo
          expect{GemaAparcamiento::Vehiculo.new(12334, 1.45, 2.0, 4.3, "700.0")}.to raise_error(ArgumentError) #El peso anchura debe ser un numeric positivo
          
        end
        it "Probando el variable de clase numero_vehiculo" do
          expect(GemaAparcamiento::Vehiculo.count()).to eq(7)
        end
    
        it "Probando función to_s" do
          expect(@veh1.to_s()).to eq("Vehiculo con id 54321, altura 1.45 m, anchura 2.0 m, largo 4.3 m y un peso de 700.0 kg")
          expect(@veh2.to_s()).to eq("Vehiculo con id 12344, altura 1.79 m, anchura 1.85 m, largo 5.26 m y un peso de 1200 kg")
        end
    
    
        it "Probando la función de comparación" do
        expect(@veh1 > @veh2).to eq(false)
        expect(@veh1 < @veh2).to eq(true)
        expect(@veh1 == @veh3).to eq(true)
        end
    
        it "Probando Enumereable en vehiculo" do
          expect(@veh1.each{|elemento| @sum = @sum + 1}).to eq(5)
          expect(@veh1.max).to eq(54321)
          expect(@veh1.sort).to eq([1.45,2.0,4.3,700.0,54321])
          expect(@veh1.min).to eq(1.45)
          expect(@veh1.select{|i| i.between?(1,2)}).to eq([1.45, 2.0]) 
        end
    
        it "Herencias de vehiculo" do
          expect(@veh1.instance_of? GemaAparcamiento::Vehiculo).to eq(true)
          expect(@veh1.is_a? Object).to eq(true)
          expect(@veh1.is_a? BasicObject).to eq(true)
          expect(@veh1.instance_of? Numeric).to eq(false)
          expect(@veh1.instance_of? String).to eq(false)
        end
      
      end
    
      describe GemaAparcamiento::Motor do
        before (:all) do
          @motor1 = GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4,5,1700,100)
          @motor4 = GemaAparcamiento::Motor.new(54321, 1.45, 2.0, 4.3, 700.0,4,5,2000,180)
          @motor2 = GemaAparcamiento::Motor.new(54321, 1.45, 2.0, 4.3, 700.0,4,2,2000,180)
          @motor3 = GemaAparcamiento::Motor.new(96128, 1.45, 2.0, 4.3, 700.0,2,1,1900,180)
        end
    
        it "Probando el initialize de vehiculo a motor" do
          expect(GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0, 4, 5, 1900, 120)).not_to eq(nil) #El peso anchura debe ser un numeric positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,-4, 5, 1900, 120)}.to raise_error(ArgumentError) #El n_ruedas debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,"4", 5, 1900, 120)}.to raise_error(ArgumentError) #El n_ruedas debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, -5, 1900, 120)}.to raise_error(ArgumentError) #El n_plazas debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, "5", 1900, 120)}.to raise_error(ArgumentError) #El n_plazas debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, 5, -1900, 120)}.to raise_error(ArgumentError) #La potencia_motor debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, 5, "1900", 120)}.to raise_error(ArgumentError) #La potencia_motor debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, 5, 1900, -120)}.to raise_error(ArgumentError) #La vel_maxima debe ser un int positivo
          expect{GemaAparcamiento::Motor.new(12334, 1.45, 2.0, 4.3, 700.0,4, 5, 1900, "120")}.to raise_error(ArgumentError) #La vel_maxima debe ser un int positivo
        end
    
        it "Probando la variable de clase de vehiculo" do
          expect(GemaAparcamiento::Motor.count()).to eq(12)
        end
     
        it "Probado to_s de vehiculo a motor" do
          expect(@motor1.to_s()).to eq("Vehiculo con id 12334, altura 1.45 m, anchura 2.0 m, largo 4.3 m y un peso de 700.0 kg. Vehiculo a motor de 4 ruedas, 5 plazas, potencia de motor de 1700 cc y máximo 100 km hora")
          expect(@motor2.to_s()).to eq("Vehiculo con id 54321, altura 1.45 m, anchura 2.0 m, largo 4.3 m y un peso de 700.0 kg. Vehiculo a motor de 4 ruedas, 2 plazas, potencia de motor de 2000 cc y máximo 180 km hora")
          expect(@motor3.to_s()).to eq("Vehiculo con id 96128, altura 1.45 m, anchura 2.0 m, largo 4.3 m y un peso de 700.0 kg. Vehiculo a motor de 2 ruedas, 1 plazas, potencia de motor de 1900 cc y máximo 180 km hora")
        end
    
        it "Probando los operadores de comparación de Motor" do 
          expect(@motor1 == @motor4).to eq(true)
          expect(@motor1 > @motor2).to eq(true)
          expect(@motor3 < @motor2).to eq(true)
        end
    
        it "Herencias de motor" do
          expect(@motor1.instance_of? GemaAparcamiento::Motor).to eq(true)
          expect(@motor1.is_a? GemaAparcamiento::Vehiculo).to eq(true)
          expect(@motor1.is_a? Object).to eq(true)
          expect(@motor1.is_a? BasicObject).to eq(true)
          expect(@motor1.instance_of? Numeric).to eq(false)
          expect(@motor1.instance_of? String).to eq(false)
        end
    
      end

end