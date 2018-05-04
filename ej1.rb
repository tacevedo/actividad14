a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

uno = a.map do |val|
  val += 1
end
puts "mas uno: #{uno}"

dos = a.map do |val|
  val.to_f
end
puts "Float #{dos}"

tres = a.map do |val|
  val.to_s
end
puts "a string #{tres}"

cuatro = a.reject{ |v| v <= 5}
puts "descarta menores 5 #{cuatro}"

cinco = a.reject{ |v| v >= 5}
puts "descarta mayores 5 #{cinco}"

seis = a.inject(0) do |sum, v|
   sum += v
end
puts "suma total: #{seis}"

siete =  a.group_by { |v| v.even? }
pares = siete[true]
impares = siete[false]
puts "pares: #{pares}"
puts "Impares: #{impares}"


ocho =  a.group_by { |v| v > 6 }
mayores = ocho[true]
menores = ocho[false]
puts "mayores 6: #{mayores}"
puts "menores a 6: #{menores}"
