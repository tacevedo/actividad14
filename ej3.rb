curso = {"tam" => {:nombre => 'tam', :edad => 22, :comuna => 'provi', :genero => 'femenino'}, "pincheira" => {:nombre => 'pincheira', :edad => 31, :comuna => 'talca', :genero => 'masculino'}}

opcion = ''
until opcion == 7 do
  puts "--------------------"
  puts "Ingresa opcion: 1: agregar,2 : editar, 3: eliminar , 4: Personas ingresadas, 5: Comunas, 6: alumnos entre 20 y 25 a;os, 7: Suma edades, 8: promedio edades, 9: personas por genero, 10 salir "
  opcion = gets.chomp
  case opcion

  when "1"
    #listo
    alumno ={}
    puts "Agregar: "
    puts "ingrese nombre"
    nombre = gets.chomp
    puts "ingrese edad"
    edad = gets.chomp
    puts "ingrese comuna"
    comuna = gets.chomp
    puts "ingrese genero"
    genero = gets.chomp

    curso[nombre] = {:nombre => nombre, :comuna => comuna, :edad => edad.to_i, :genero => genero}

    puts curso

  when "2"
    puts "el curso es #{curso}"
    puts 'Para Editar, ingrese nombre completo del alumno'
    actualiza = gets.chomp


  when "3"
    #listo
    puts "el curso es #{curso}"
    puts 'Ingrese el nombre del alumno que quiere eliminar'
    eliminar = gets.chomp
    curso.delete(eliminar)

  when "4"
    #listo
    total = curso.length
    puts "El numero de alumnos es:  #{total}"

  when "5"
    comunas = {}
    curso.map do |alumno|
      puts "alumno #{alumno}"
      alumno.each_with_index.map do |v, i|
        puts "datos #{i} - #{v}"

        if i == 1
          puts v[:comuna]
          comunas[v[:comuna]] = 1
        end

      end
      puts "------------"
    end
     puts comunas
  when "6"
    #listo
    edades = {}
    curso.map do |val|
      puts val
      val.each_with_index.map do |val, i|
        if i == 1 && val[:edad] > 20 && val[:edad] < 26
            edades[val[:nombre]] = val
        end
      end
    end
    puts "edades #{edades}"

  when "7"
    #listo
    totaledad = 0
    curso.map do |val|

      val.each_with_index.map do |val, i|
        if i ==1
          totaledad += val[:edad]
        end
      end
    end
    puts "total edades curso #{totaledad}"

  when "8"
    #listo
    promedioedades = 0
    curso.map do |val|
      puts val
      val.each_with_index.map do |val, i|
        if i ==1
          promedioedades += val[:edad]
        end
      end
    end
    promedioedades = promedioedades.to_f / curso.length.to_f
    puts "total edades curso #{promedioedades}"


  when "9"
    

  when "10"
    puts 'Adios'
    break

  else
    puts "opcion incorrecta"
  end
end
