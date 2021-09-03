require_relative 'cliente'
require_relative 'helper_file'

class GestorCliente
	attr_accessor :clientes
	
	def initialize
		@clientes = []
	end
	
	def cargar_datos(filename)
		data = HelperFile.leer(filename)
		pp data.size
		pp data[0].size
		data.each do |columna|
			cliente = Cliente.new(columna[0], columna[1], columna[2], columna[3], columna[4])
			@clientes.push(cliente)
		end
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