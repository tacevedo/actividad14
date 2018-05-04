nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray", "uPa"]

uno = nombres.select { |v| v.length > 5}
puts "nombres mayores a 5 #{uno}"

dos = nombres.map { |v| v.downcase}
puts "nombres minuscula #{dos}"

tres = nombres.select { |v| v[0].include?('P')}
puts "nombres con P #{tres}"

cuatro = nombres.map { |v| v.length}
puts "nombres con P #{cuatro}"

cinco = nombres.map { |v| v.gsub(/[aeiou]/, '') }
puts "nombres con P #{cinco}"
