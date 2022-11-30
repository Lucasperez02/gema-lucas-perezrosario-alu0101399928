# frozen_string_literal: true

RSpec.describe GemaAparcamiento do
  it "has a version number" do
    expect(GemaAparcamiento::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
  it "Jerarquía de herencia de Aparcamiento" do
    expect(GemaAparcamiento.is_a? Object).to eq(true)
    expect(GemaAparcamiento.is_a? BasicObject).to eq(true)
    expect(GemaAparcamiento.is_a? Module).to eq(true)
    expect(GemaAparcamiento.is_a? GemaAparcamiento::Vehiculo).to eq(false)
    expect(GemaAparcamiento.is_a? GemaAparcamiento::Motor).to eq(false)
    expect(GemaAparcamiento.is_a? Class).to eq(false)      
  end


  describe GemaAparcamiento::Funcionalidades do
    before (:all) do
      @veh1_1 = GemaAparcamiento::Vehiculo.new(54321, 1.45, 2.0, 4.3, 700.0)
      @veh2_2 = GemaAparcamiento::Vehiculo.new(12344, 1.79, 1.85, 5.26, 1200)      
      @aparcamiento_libre = GemaAparcamiento::Datos.new(3, 8, 23414, "Carrefour", "Mixto", "coches", 200, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2, @veh1_1, @veh2_2])
      @aparcamiento_lleno = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 4, 2, 3, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2])
      @apar_no_cumple = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 70, 2, 1, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2])
      @apar_cumple = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 40, 2, 10, 4, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2])
      @apar_menos_40 = GemaAparcamiento::Datos.new(4, 10,43961,"HiperDino", "Cubierto", "motos", 30, 2, 0, 0, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2])
      @aparcamiento_estac_tren = GemaAparcamiento::EstacTren.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5,1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],8)
      @aparcamiento_estac_aeropuerto = GemaAparcamiento::EstacAeropuerto.new(1, 10, 12345, "Mercadona", "Mixto", "coches", 20, 2, 5, 1, 0.5, [@veh1_1, @veh2_2, @veh1_1, @veh2_2],3)
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


    it "Probando función cumple_plazas_minusvalidos" do
      expect(GemaAparcamiento::Funcionalidades.cumple_plazas_minusvalidos(@apar_cumple)).to eq(true)
      expect(GemaAparcamiento::Funcionalidades.cumple_plazas_minusvalidos(@apar_no_cumple)).to eq(false)
      expect(GemaAparcamiento::Funcionalidades.cumple_plazas_minusvalidos(@apar_menos_40)).to eq(true)
    end

    it "Probando la función plazas_minus_libres_aparc" do 
      expect(GemaAparcamiento::Funcionalidades.plazas_minus_libres_aparc(@apar_cumple)).to eq(6)
      expect(GemaAparcamiento::Funcionalidades.plazas_minus_libres_aparc(@apar_no_cumple)).to eq(0)
    end

    it "Probando función para obtener el número de vehiculos en un aparcamiento" do
      expect(GemaAparcamiento::Funcionalidades.vehiculos_estacionados(@aparcamiento_lleno)).to eq(4)
      expect(GemaAparcamiento::Funcionalidades.vehiculos_estacionados(@aparcamiento_estac_tren)).to eq("Aparcamiento de una estación de tren con 20 plazas, de las cuales 8 son de larga estancia. El estacionamiento tiene 4 vehiculos")
      expect(GemaAparcamiento::Funcionalidades.vehiculos_estacionados(@aparcamiento_estac_aeropuerto)).to eq("Aparcamiento de un aeropuerto con 20 plazas, divididas en 3 plantas. El estacionamiento tiene 4 vehiculos")
    end
  end
  
end
