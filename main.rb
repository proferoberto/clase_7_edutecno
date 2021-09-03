require 'faker'
require_relative 'cliente'
require_relative 'gestor_cliente'
require_relative 'helper_file'

# Main
# Interfaces

clientes = GestorCliente.new
loop do
  puts "Opciones elige un numero"
  puts "0) Cargar base de datos"
  puts "1) Listar"
  puts "2) Crear"
  puts "3) Actualizar"
  puts "4) Eliminar"
  puts "5) Importar base de datos"
  puts "6) Salir"
  opt = gets.chomp.to_i
  case opt
  when 0
    puts "Vas empezar a cargar datos en unos instantes"
    HelperFile.cargar_datos(50, "clientes.csv")
    puts "Los datos se terminaron de generar"
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
  when 5
    puts "Cual es el nombre del archivo"
    nombre_archivo = gets.chomp
    clientes.cargar_datos(nombre_archivo)
    puts "La data se cargo correctamente a tu programa"
  when 6
    break
  end
end

