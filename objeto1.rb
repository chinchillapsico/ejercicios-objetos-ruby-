class Table
    attr_accessor :mesa, :recaudacion #permite modificar variables instanciadas

    def initialize(mesa, *recaudacion) #* toma varios argumentos y permite trabajar con ellos separados pero todos a la vez
        @mesa = mesa
        @recaudacion = recaudacion.map(&:to_i) # todos pasan a entero :& 
    end 
    def mayor_valor
        @recaudacion.max
    end  
    def promedio
        @recaudacion.sum/@recaudacion.size.to_f
    end    
end

file = File.open('casino.txt', 'r') 
data = file.readlines
file.close
recaudacion_array = [] #nuevo array donde guardaré los valores

data.each do |lines|
    line = lines.split(', ')
    recaudacion_array << Table.new(*line) #todo lo paso al array recaudacion_array
end
recaudacion_array.each_with_index do |t, i| # each_with_index permite manejar indices partiendo en cero, hace lo mismo que each pero añade index
    puts "#{t.mesa} recaudó #{t.mayor_valor} el día #{i+1}"
end    

promedios = recaudacion_array.map(&:promedio)

puts " el promedio total  es #{promedios.sum/promedios.size}"


# ruby objeto1.rb