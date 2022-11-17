# frozen_string_literal: true

RSpec.describe GemaAparcamiento do
  it "has a version number" do
    expect(GemaAparcamiento::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
  describe GemaAparcamiento::Datos do
    before (:all) do
      @apar1 = GemaAparcamiento::Datos.new(3, 8, 23414, "Carrefour", "Mixto", "coches", 200, 120)
      @apar2 = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 20, 5)
    end

    it "Instancia de un aparcamiento" do
      expect(GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27)).not_to eq(nil)
      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de accesibilidad debe ser un int positivo
      expect{GemaAparcamiento::Datos.new(7, 10, 12345, "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de accesibilidad debe estar entre 1 - 5

      expect{GemaAparcamiento::Datos.new(1, -1, 12345, "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de seguridad debe ser un int positivo
      expect{GemaAparcamiento::Datos.new(1, 11, 12345, "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de seguridad debe estar entre 1 - 10)

      expect{GemaAparcamiento::Datos.new(1, 10, -12345, "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo   
      expect{GemaAparcamiento::Datos.new(1, 10, "12345", "Mercadona", "Mixto", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, 4, "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de nombre_comercial debe ser una string

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Otro", "coches", 30, 27)}.to raise_error(ArgumentError) #El valor de descripcion debe ser un string (Mixto, Cubierto, Aire libre)

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "camiones", 30, 27)}.to raise_error(ArgumentError) #El valor de tipo_aparcamiento debe ser un string (Mixto, )

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", -30, 27)}.to raise_error(ArgumentError) #El valor de plazas debe ser un int > 0
      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "coches", "20", 27)}.to raise_error(ArgumentError) #El valor de plazas debe ser un int > 0

      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "coches", 30, -27)}.to raise_error(ArgumentError) #El valor de plazas_ocupadas debe ser un int > 0
      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "coches", 30, "20")}.to raise_error(ArgumentError) #El valor de plazas_ocupadas debe ser un int > 0
      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "coches", 30, 45)}.to raise_error(ArgumentError) #El numeor de plazas ocupadas debe ser < numero de plazas
    end

    it "Probando la función para obtener el número de plazas del aparcamiento" do
      expect(@apar1.get_plazas_totales()).to eq(200)
      expect(@apar2.get_plazas_totales()).to eq(20)
    end

    it "Probanod método para devolver el número de plazas libres" do
      expect(@apar1.plazas_libres()).to eq(80)
      expect(@apar2.plazas_libres()).to eq(15)
    end
   
    it "Probando función to_s" do
      expect(@apar1.to_s()).to eq("Aparcamiento con accesibilidad 3, seguridad 8 e id 23414. Establecimiento en Carrefour, Mixto y del tipo coches. Plazas totales 200 y 120 ocupadas")
      expect(@apar2.to_s()).to eq("Aparcamiento con accesibilidad 4, seguridad 10 e id 43961. Establecimiento en HiperDino, Cubierto y del tipo motos. Plazas totales 20 y 5 ocupadas")
    end
  end

  describe GemaAparcamiento::Funcionalidades do
    before (:all) do
      @aparcamiento_libre = GemaAparcamiento::Datos.new(3, 8, 23414, "Carrefour", "Mixto", "coches", 200, 120)
      @aparcamiento_lleno = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 20, 20)
    end
    it "Probando la constante LLENO" do
      expect(GemaAparcamiento::Funcionalidades::APAR_LLENO).to eq ("Lleno")
    end
 
    it "Probando la constante LIBRE" do
      expect(GemaAparcamiento::Funcionalidades::APAR_LIBRE).to eq ("Libre")
    end

    it "Probanod la función estado_de_aparcamiento" do
      expect(GemaAparcamiento::Funcionalidades.estado_de_aparcamiento(@aparcamiento_libre)).to eq(GemaAparcamiento::Funcionalidades::APAR_LIBRE)

      expect(GemaAparcamiento::Funcionalidades.estado_de_aparcamiento(@aparcamiento_lleno)).to eq(GemaAparcamiento::Funcionalidades::APAR_LLENO)

      expect{GemaAparcamiento::Funcionalidades.estado_de_aparcamiento(1)}.to raise_error(ArgumentError) #El objeto debe ser de la clase Dato 
    end


  end

  describe GemaAparcamiento::Vehiculo do
    before (:all) do
      @veh1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
      @veh2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)
      @veh3 = GemaAparcamiento::Vehiculo.new(61242,2,1.45,4.3, 850)
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
      expect(GemaAparcamiento::Vehiculo.count()).to eq(4)
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

    it "Herencias de vehiculo" do
      expect(@veh1.instance_of? GemaAparcamiento::Vehiculo).to eq(true)
      expect(@veh1.is_a? Object).to eq(true)
      expect(@veh1.is_a? BasicObject).to eq(true)
      expect(@veh1.instance_of? Numeric).to eq(false)
      expect(@veh1.instance_of? String).to eq(false)
    end
  
  end

  describe GemaAparcamiento::Motor do

    it "Probando el initialize de vehiculo a motor" do
      expect(GemaAparcamiento::Motor.new(4, 5, 1900, 120)).not_to eq(nil)
      expect{GemaAparcamiento::Motor.new(-4, 5, 1900, 120)}.to raise_error(ArgumentError) #El n_ruedas debe ser un int positivo
      expect{GemaAparcamiento::Motor.new("4", 5, 1900, 120)}.to raise_error(ArgumentError) #El n_ruedas debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, -5, 1900, 120)}.to raise_error(ArgumentError) #El n_plazas debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, "5", 1900, 120)}.to raise_error(ArgumentError) #El n_plazas debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, 5, -1900, 120)}.to raise_error(ArgumentError) #La potencia_motor debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, 5, "1900", 120)}.to raise_error(ArgumentError) #La potencia_motor debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, 5, 1900, -120)}.to raise_error(ArgumentError) #La vel_maxima debe ser un int positivo
      expect{GemaAparcamiento::Motor.new(4, 5, 1900, "120")}.to raise_error(ArgumentError) #La vel_maxima debe ser un int positivo
      
    end

  end
end
