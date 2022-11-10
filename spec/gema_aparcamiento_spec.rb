# frozen_string_literal: true

RSpec.describe GemaAparcamiento do
  it "has a version number" do
    expect(GemaAparcamiento::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
  describe GemaAparcamiento::Datos do
    it "Instancia de un aparcamiento" do
      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "Coches", 30, 27)}.not_to eq(nil)
      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de accesibilidad debe ser un int positivo
      expect{GemaAparcamiento::Datos.new(7, 10, 12345, "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de accesibilidad debe estar entre 1 - 5

      expect{GemaAparcamiento::Datos.new(1, -1, 12345, "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de seguridad debe ser un int positivo
      expect{GemaAparcamiento::Datos.new(1, 11, 12345, "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de seguridad debe estar entre 1 - 10)

      expect{GemaAparcamiento::Datos.new(1, 10, -12345, "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo   
      expect{GemaAparcamiento::Datos.new(1, 10, "12345", "Mercadona", "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de id debe ser un int positivo

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, 4, "Mixto", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de nombre_comercial debe ser una string

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Otro", "Coches", 30, 27)}.to raise_error(ArgumentError) #El valor de descripcion debe ser un string (Mixto, )

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "Bicicleta", 30, 27)}.to raise_error(ArgumentError) #El valor de tipo_aparcamiento debe ser un string (Mixto, )

      expect{GemaAparcamiento::Datos.new(1, 10, 12345, "Mercadona", "Mixto", "Coches", -30, 27)}.to raise_error(ArgumentError) #El valor de plazas debe ser un int > 0

      expect{GemaAparcamiento::Datos.new(-1, 10, 12345, "Mercadona", "Mixto", "Coches", 30, -27)}.to raise_error(ArgumentError) #El valor de plazas_ocupadas debe ser un int > 0
    end
  end
  
  describe GemaAparcamiento::Funcionalidades do

  end
end
