#EJERCICIO 1 Sintaxis Básica

h = { :claveuno => 10, :clavedos => 20, :clavetres => 30 }

#Modificar el hash para utilizar la sintaxis de Ruby 2.0+
h = {claveuno:10, clavedos:20, clavetres:30}

#EJERCICIO 2 Corrección de errores

productos = {'bebida' => 850, 'chocolate' => 1200, 'galletas' => 900, 'leche'
=> 750}

#2.1
# a) se realiza la siguiente consulta para conocer los productos existentes:
  Productos.each { |valor, producto| puts producto }

# b)Corrige el error para mostrar la información solicitada
  productos.each { |producto, valor | puts producto }

#2.2 agregar nuevo producto al hash ---> producto[2200] = cereal

productos['cereal'] = 2200

#2.3

productos['bebida'] = 2000

#2.4

product = productos.to_a
print product

#2.5

productos.delete('galletas')
print productos

#EJERCICIO 3 Operaciones Básicas

h = {"x": 1, "y":2}

#3.1
h["z"] = 3

#3.2
h[:x] = 5

#3.3
h.delete(:y)

#3.4
h["z"] = 3
h.each do |key, value| puts key, value
  if key == "z"
    h["z"] = 'yeeeah'
  end
end
print h

#3.5
h = {"x": 1, "y":2}.invert

#EJERCICIO 4 Array y Hashes

personas = ["Carolina", "Alejandro", "Maria Jesús", "Valentín"]
edades = [32, 28, 41, 19]

#4.1

array = Hash[personas.zip(edades)]
puts array

#4.2

def promedio (arr)
  sum = 0.0
  result = arr.length
  arr.each do |name, age|
    sum += age
  end
    puts "El promedio de edades es: " + (sum/result).to_s
end

promedio array

#EJERCICIO 5 Array y Hashes

meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo']
ventas = [2000, 3000, 1000, 5000, 4000]

#5.1
h = Hash[meses.zip(ventas)]
puts h

#5.2

puts h.invert

#5.2.1

aux = 0
var = 0

h1.each do |price, month|
  if price > aux
  aux = price
  var = month
  end
end

puts "El mes de #{var}, tiene la mayor cantidad de ventas con: $#{aux}"

#EJERCICIO 6 Operaciones típicas sobre un hash

restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }

#6.1

p = 0
f = 0

restaurant_menu.each do |food, price|
  if price > p
    p = price
    f = food
  end
end
puts "El plato #{f} tiene el precio más caro: $#{p}"

#6.2

p = 50
f = 0

restaurant_menu.each do |food, price|
  if price < p
    p = price
    f = food
  end
end
puts "El plato #{f} es el más barato: $#{p}"

#6.3

avr = 0
count = restaurant_menu.length

restaurant_menu.each do |name, price|
  avr += price.to_f
end
puts "El promedio del valor del menu es: #{avr/count}"

#6.4

a= []

restaurant_menu.each do |name, price|
  a.push(name)
end

puts a

#6.5

a= []

restaurant_menu.each do |name, price|
  a.push(price)
end

puts a

#6.6

a= {}

restaurant_menu.each do |name, price|
  a = restaurant_menu
  a[name] = price*1.19
end

puts a

#6.7

restaurant_menu.each do |name, price|
  if name.split(" ").count >= 2
    restaurant_menu[name] = price*0.8
  end
end

puts restaurant_menu


# Ejercicio 7completo con un hash

#Se tiene un hash con el inventario de un negocio de computadores.
inventario = {Notebooks: 4, PCEscritorio: 6, Routers: 10, Impresoras: 6}
#Se pide:
#Crear un menú de 4 opciones, es decir, el usuario puede ingresar 1 2 3 o 4 y según eso el programa realizará distintas funciones.
def menu
 puts('Por favor, ingrese un numero:
  1) Agregar un producto
  2) Eliminar un producto
  3) Actualizar informacion de un producto
  4) Mostrar stock total
  5) Mostrar producto con mayor stock
  6) Verificar si un producto existe
  7) Salir')
end
#Si el usuario ingresa 1, podrá agregar un item y su stock en un solo string y agregarlo al hash.
#Para separar el nombre del stock el usuario debe utilizar una coma.
#Ejemplo del input: "Pendrives, 100"
def addproduct (p,i)
  newarray = p.split(',')
  i[newarray.first.to_sym] = newarray.last.to_i
end
#Si el usuario ingresa 2, podrá eliminar un item.
def deleteproduct (p,i)
 i.delete(p.to_sym)
 puts "Se a eliminado #{p} del inventario"
end
#Si el usuario ingresa 3, puede actualizar la información almacenada (item y stock).
#lo mismo que 1
#Si el usuario ingresa 4, podrá ver el stock total (suma del stock de cada item) que hay en el negocio.
def showtotal (p)
  p.values.sum
end
#Si el usuario ingresa 5, podrá ver el ítem que tiene la mayor cantidad de stock.
def maxstock (p)
  p.key(p.values.max)
end
#Si el usuario ingresa 6 podrá ingresar y preguntarle al sistema si un item existe en el inventario o no.
def existe (p,i)
  if i.has_key?(p.to_sym)
    puts "#{p} si existe"
  else
    puts "#{p} no se encuentra registrado"
  end
end
#El programa debe repertirse hasta que el usuario ingrese 7 (salir).
ask = true
while ask == true
  print menu
  x = gets.to_i
    if x == 1
      print inventario
      puts 'ingrese producto y valor a modificar. (separados por ",")'
      puts 'ejemplo: Producto,100'
      addproduct(gets.chomp, inventario)
    elsif x == 2
      puts inventario
      puts 'ingrese producto a eliminar:'
      y = deleteproduct(gets.chomp,inventario)
      puts y
    elsif x == 3
        print inventario
        puts 'ingrese nuevo producto y valor (separados por ","):'
        puts 'ejemplo: Producto,100'
        addproduct(gets.chomp, inventario)
        puts "se a modificado #{p} correctamente"
    elsif x == 4
      puts "Existen #{showtotal(inventario)} productos en total"
    elsif x == 5
      puts "el prodcuto con mayor stock es #{maxstock(inventario)}"
    elsif x == 6
      puts "Que producto busca?"
      existe(gets.chomp,inventario)
    elsif x == 7
      ask = false
      print 'adios'
    else
      puts "ingrese una opcion valida"
    end
end