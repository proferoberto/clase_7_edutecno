class Cliente

    #Metodos acesores
    attr_accessor :nombre, :apellido, :email, :telefono
    attr_reader :id
    
    #Constructor
    def initialize(id, nombre, apellido, email, telefono)
      @id = id
      @nombre = nombre
      @apellido = apellido
      @email = email
      @telefono = telefono
    end
  end