
class HelperFile
    def self.leer(filename)
        data = []
        lineas = File.readlines(filename)
		lineas.each do |line|
            columnas = line.split(',')
            data.push(columnas)
        end
        data
    end
    
    def self.cargar_datos(rows, filename)
      File.open(filename, "a") do |file|
        rows.times do
            id = Faker::IDNumber.unique.south_african_id_number
            nombre = Faker::Name.unique.first_name 
            apellido = Faker::Name.unique.last_name
            email = Faker::Internet.email
            telefono = Faker::PhoneNumber.cell_phone_in_e164
            file.write("#{id},#{nombre},#{apellido},#{email},#{telefono}\n")
        end
      end
    end
end