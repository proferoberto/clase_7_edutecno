
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

class GestorCliente
  attr_accessor :clientes
  def initialize
    @clientes = []
  end

  def listar
    @clientes
  end
  
  def crear(id, nombre, apellido, email, telefono)
    cliente = Cliente.new(id, nombre, apellido, email, telefono)
    @clientes.push(cliente)
    cliente
  end

  # Podemos mandar un hash de informacion
  def actualizar(id, nombre, apellido, email, telefono)
    @clientes.each do |cliente|
      if cliente.id == id
        cliente.nombre = nombre unless nombre.nil?
        cliente.apellido = apellido unless apellido.nil?
        cliente.email = email unless email.nil?
        cliente.telefono = telefono unless telefono.nil?
        break
      end
    end
  end

  def eliminar(id)
    tempClientes = []
    cliente_eliminado = nil
    @clientes.each_with_index do |cliente, index|
      unless cliente.id == id
        tempClientes.push(cliente)
      else
        cliente_eliminado = cliente
      end
    end
    unless cliente_eliminado.nil?
      @clientes = tempClientes
      cliente_eliminado
    end
    #@clientes.delete_if{|cliente| cliente.id == id}
    #@clientes.delete_at(encontrado) unless encontrado.nil?
  end
end

# Interfaces
clientes = GestorCliente.new
loop do
  puts "Opciones elige un numero"
  puts "1) Listar"
  puts "2) Crear"
  puts "3) Actualizar"
  puts "4) Eliminar"
  opt = gets.chomp.to_i
  case opt
  when 1
    puts "ID - Nombre - Apellido - email - Telefono"
    clientes.listar.each{|cliente| puts "#{cliente.id} #{cliente.nombre} #{cliente.apellido} #{cliente.email} #{cliente.telefono}"}
  when 2
    loop do
      puts "Ingrese los datos en el siguiente formato  id,nombre,apellido,email,telefono"
      data = gets.chomp.split(",")
      cliente = clientes.crear(data[0], data[1], data[2], data[3], data[4].to_i)
      puts "El cliente #{cliente.nombre} ha sido agregado correctamente"
      puts "Desea continuar s/n"
      opt = gets.chomp
      break if opt.eql?"n"
    end
  when 3
    puts "Ingrese los datos en el siguiente formato id, nombre,apellido,email,telefono"
    puts "Si algun campo no sea actualizar coloque *"
    entrada = gets.chomp
    data = entrada.split(",")
    data.map!{|item| item == '*'? nil:item}
    cliente = clientes.actualizar(data[0], data[1], data[2], data[3], data[4])
  when 4
    puts "Ingrese el id de la persona a eliminar"
    data = gets.chomp
    cliente = clientes.eliminar(data)
    unless cliente.nil?
      puts "El cliente #{cliente.nombre} ha si do eliminado."
    else
      puts "El id no se encontro por lo tanto no se puedo eliminar un cliente."
    end
  end
end

