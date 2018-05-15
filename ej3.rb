curso = {"tam" => {:nombre => 'tam', :edad => 22, :comuna => 'provi', :genero => 'femenino'},
    "pincheira" => {:nombre => 'pincheira', :edad => 31, :comuna => 'talca', :genero => 'masculino'}}

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
    puts "ingrese genero (femenino o masculino)"
    genero = gets.chomp

    curso[nombre] = {:nombre => nombre, :comuna => comuna, :edad => edad.to_i, :genero => genero}

    puts curso

  when "2"
    puts "el curso es #{curso}"
    puts 'Para Editar, ingrese nombre completo del alumno'
    actualiza = gets.chomp
    puts curso.has_key? actualiza
    if curso.has_key? actualiza
      puts 'Ingrese nuevo nombre o deje vacio para mantener, Nombre:'
      name = gets.chomp
      nombre_bien = ''
      if actualiza != name && name != ''
        nombre_bien = name.gsub(' ', '_')
        curso[nombre_bien] = curso[actualiza].clone
        curso[nombre_bien][:nombre] = name
      else
        nombre_bien = actualiza
        curso[nombre_bien] = curso.delete actualiza
      end

      puts 'Ingrese nuevo comuna o deje vacio para mantener, Comuna:'
      comu = gets.chomp
      if curso[nombre_bien][:comuna] != comu && comu != ''
        curso[nombre_bien][:comuna] = comu
      end

      puts 'Ingrese nuevo Edad o deje vacio para mantener, Edad:'
      age = gets.chomp
      if curso[nombre_bien][:edad] != age && age != ''
        curso[nombre_bien][:edad] = age
      end

      puts 'Ingrese nuevo genero o deje vacio para mantener, Genero (femenino o masculino):'
      sexo = gets.chomp
      if curso[nombre_bien][:genero] != sexo && sexo != ''
        curso[nombre_bien][:genero] = sexo
      end

      puts "el alumno quedo como> #{curso[nombre_bien]}"
      curso.delete(actualiza)
    else
      puts "Alumno no existe"
    end

  when "3"
    #listo
    puts "Los alumnos son:"
    curso.each do |k, v|
      puts v[:nombre]
    end
    puts 'Ingrese el nombre del alumno que quiere eliminar'
    eliminar = gets.chomp
    if !curso[eliminar]
      puts "Alumno no existe"
    else
      curso.delete(eliminar)
      puts "Eliminado #{eliminar}"
    end

  when "4"
    #listo
    total = curso.length
    puts "El numero de alumnos es:  #{total}"

  when "5"
    # listo
    comunas = {}
    curso.map do |alumno|
      alumno.each_with_index do |v, i|
        if i == 1
          if comunas[v[:comuna].downcase] != nil
            comunas[v[:comuna].downcase] += 1
          else
            comunas[v[:comuna].downcase] = 1
          end
        end

      end

    end
     puts "comunas #{comunas}"
     puts "------------"

  when "6"
    #listo
    edades = {}
    curso.map do |val|
      val.each_with_index do |val, i|
        if i == 1 && val[:edad] > 20 && val[:edad] < 26
            edades[val[:nombre]] = val[:edad]
        end
      end
    end
    puts "edades #{edades}"

  when "7"
    #listo
    totaledad = 0
    curso.each do |val|
      val.each_with_index do |val, i|
        if i ==1
          totaledad += val[:edad]
        end
      end
    end
    puts "total edades curso #{totaledad}"

  when "8"
    #listo
    promedioedades = 0
    curso.each do |val|
      val.each_with_index do |val, i|
        if i ==1
          promedioedades += val[:edad]
        end
      end
    end
    promedioedades = promedioedades.to_f / curso.length.to_f
    puts "total edades curso #{promedioedades}"


  when "9"
    #listo

    generos = {"femenino" => curso.select { |k, alumno| alumno[:genero] == 'femenino' }, "masculino" => curso.select { |k, alumno| curso[k][:genero] == 'masculino' }  }
    print "generos: #{generos}"
    puts "============="

  when "10"
    puts 'Adios'
    break

  else
    puts "opcion incorrecta"
  end
end
