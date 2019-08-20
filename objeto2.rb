require 'date' #para trabajar con fechas, usamos esto que permite trabajar con fechas sin necesidad de mayores problemas, usamos la libreria de fechas.

class Course
    attr_accessor :curso, :fecha_inicio, :fecha_fin

    def initialize(curso,fecha_inicio,fecha_fin)
        @curso = curso #instancio las variables
        @fecha_inicio = Date.parse(fecha_inicio) #transforma la fecha en string con formato de fecha
        @fecha_fin = Date.parse(fecha_fin)
    end  
    
    def antes(today)
        if fecha_inicio < today
            puts "el curso #{curso} empieza el #{fecha_inicio}"
        end
    end
    def despues(today)
        if fecha_fin > today
            puts "el curso #{curso} empezará el #{fecha_fin} "
        end    
    end    

end

file = File.open('cursos.txt', 'r') #abrir archivo
data = file.readlines #leer archivo
file.close #cerramos archivo para que no ocupe memoria
fechas_array = []

data.each do |lines|
    curso,fecha_inicio,fecha_fin = lines.split(', ') #separa en tres dividido por comas transormando en array
    fechas_array << Course.new(curso,fecha_inicio,fecha_fin) #tiro todo al array vacío
end

fechas_array.each do |fechas_array|
    fechas_array.antes(Date.today) # today es un metodo que hace refencia al presente y retorna en formato fecha.
    fechas_array.despues(Date.today)
end


# ruby objeto2.rb