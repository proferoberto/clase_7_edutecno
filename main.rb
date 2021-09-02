
class Cliente

  #Metodos acesores
  attr_accessor :nombre, :apellido, :email, :telefono
  
  #Constructor
  def initialize(nombre, apellido, email, telefono)
    @nombre = nombre
    @apellido = apellido
    @email = email
    @telefono = telefono
  end
end

class GestorCliente
  attr_accessor :clientes
  def initialize
    @clientes = []
  end

  def listar
    @clientes
  end
  
  def crear(nombre, apellido, email, telefono)
    cliente = Cliente.new(nombre, apellido, email, telefono)
    @clientes.push(cliente)
    cliente
  end

  def actualizar
  end

  def eliminar
  end
end

def UiCrear(clientes)

end

def UiListar(clientes)
end

# Interfaces
clientes = GestorCliente.new
loop do
  puts "Opciones elige un numero"
  puts "1) Listar"
  puts "2) Crear"
  opt = gets.chomp.to_i
  case opt
  when 1
    puts "Nombre - Apellido - email - Telefono"
    clientes.listar.each{|cliente| puts "#{cliente.nombre} #{cliente.apellido} #{cliente.email} #{cliente.telefono}"}
  when 2
    loop do
      puts "Ingrese los datos en el siguiente formato nombre,apellido,email,telefono"
      data = gets.chomp.split(",")
      cliente = clientes.crear(data[0], data[1], data[2], data[3].to_i)
      puts "El cliente #{cliente.nombre} ha sido agregado correctamente"
      puts "Desea continuar s/n"
      opt = gets.chomp
      break if opt.eql?"n"
    end
  end
end

