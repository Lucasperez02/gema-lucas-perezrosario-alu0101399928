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
      expect{Datos.new(1, 10, 12345, "Mercadona", "Mixto", "Coches", 30, 27).not_to eq(nil)}
      
    end

  end
  
  describe GemaAparcamiento::Funcionalidades do

  end
end
