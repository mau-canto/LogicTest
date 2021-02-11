//Hecho por Mauricio Canto 11/Feb/2021
//Ejercicio 2

import Foundation

//constantes
let instrucciones: String = """
# Ejercicio 2
A well-known software development company has been commissioned by the Archaeological Society. One of the modules has to help the archaeologists to process data about the ruins of buildings they have found during their excavations of ancient cities. Development of this module has been assigned to Vasya.

Vasya, being a seasoned programmer, at once noticed that the module would need a database to contain the descriptions of the ruins and the estimated construction times of the buildings. It would be all fine, but suddenly the manager got the genial idea that since the database describes Roman ruins, the years of construction should be stored in the Roman number system. Now Vasya is wondering how many symbols he needs to set aside for each year number field in the database. According to the functional specification, the software module must be able to handle years from A to B (inclusive). Help Vasya determine the minimal number of characters sufficient for storing any year number in the range from A to B.

Especificación de entrada
The only input line contains the descriptions of the years A and B, separated by the "-" sign. A description of a year consists of one to four decimal digits (the number of the year), followed by either "AD" (Anno Domini, the current era) or "BC" (Before Christ, before the current era). In both directions the years are numbered starting from 1. It is known that (753BC) <= A <= B <= (2012AD).

Especificación de salida
The output should consist of a single integer, the minimal number of characters that have to be reserved in the database for the year number.

Ejemplo de entrada
1BC-1AD

Ejemplo de salida
7

Hint(s)
For input:
753BC-747BC
Output must be:
3

For input:
2000AD-2012AD
Output must be:
10

Nota:
It is important to remember that the Romans did not use the AD/BC concepts. Instead, they counted the years from the mythical founding of Rome (Anno Urbis Conditae - 753BC).
"""

//variables
var a1: Int 				//es el valor inferior en el rango de años que se evaluará, el rango máximo va desde el Anno Urbis Conditae que es el 753BC hasta el 2021AC
var a2: Int					//es el valor superiro en el rango de años que se evaluará.
var era1: String 			//decide si es BC o AC para a1, si es BC hay que restarle a 754 el valor de los años, si es AC hay que sumarle al valor de los años 753, de esta manera se obtiene el valor como usaban los romanos
var era2: String 			//decide si es BC o AC para a2
var roman1: Int				//para guardar el valor del año romano en dígitos para a1
var roman2: Int				//para guardar el valor del año romano en dígitos para a2
var letras1: String	= ""	//para guardar el valor del año romano en letras para a1
var letras2: String	= ""	//para guardar el valor del año romano en letras para a2
var cantidad1: Int			//para guardar el número de la cantidad de espacios para a1
var cantidad2: Int			//para guardar el número de la cantidad de espacios para a2

var salida: Int 			//Es el valor entero final que será la salida con el número mínimo de caracteres reservdos para el número del año en romano con letras


//Valores temporales default
a1 = -753
a2 = 2021

print(instrucciones)

//Datos generados aleatoriamente para establecer un rango
(a1, a2) = datosAleatorios(year1: a1, year2: a2 ) //si se quiere usar los valores default, comentar esta línea

//Convertior datos aleatorios en el dato de entrada
(roman1, era1) = romanonumero(year: a1)
(roman2, era2) = romanonumero(year: a2)

//Datos de entrada
print("\nDatos de entrada \n   \(abs(a1))\(era1)-\(abs(a2))\(era2)")

//Años en romano con dígitos
print("\nAños romanos en dígitos \n   \(roman1)-\(roman2)\n")

//Años en romano con letras
letras1 = convNumRomano(roman: roman1)
letras2 = convNumRomano(roman: roman2)

//Se cuenta la cantidad de espacios que utilizan los límites
cantidad1 = letras1.count
cantidad2 = letras2.count

//Se imprimir frase con los datos obtenidos hasta ahora
imprimirFrase (roman: roman1, letras: letras1, cantidad: cantidad1)
imprimirFrase (roman: roman2, letras: letras2, cantidad: cantidad2)

//Buscar el mayor valor entre las canitdades de letras dentro del rango
salida = maxLetras (LI_f: roman1, LS_f: roman2)

print("\nLa máxima cantidad de espacios necesarios para guardar los números de los años romanos con letras en el rango entre los años \(abs(a1))\(era1)-\(abs(a2))\(era2) que es \(roman1)-\(roman2) en años romanos con dígitos es: \(salida)")
print("\nDato de salida \(salida)\n")



//*** Funciones ***
//--- Generar datos aleatorios ---
func datosAleatorios(year1: Int, year2: Int ) -> (Int, Int){
	var year1: Int = year1  //a1 fuera de la función
	var year2: Int = year2  //a2 fuera de la función
	year1 = Int.random(in: -753...2020) //se da un valor aleatorio al valor inferior del rango de años
	//print("\n\(year1)\n")
	repeat  {
		year2 = Int.random(in: -753...2021) //se da un valor aleatorio al valor superior del rango de años
		//print (year2)

	} while year2 <= year1 //si el valor del límite superior sale menor que el inferior se repite hasta que se consigue uno mayor
	//print()
	//print (year1)
	//print (year2)
	return (year1, year2)
}

//--- Conversión a años romanos con digitos y agregar el BC o AC según corresponda el año en el rango ---
func romanonumero (year: Int) -> (Int, String) {
	var era: String
	var roman: Int
	if year < 0 {
		era = "BC"
		roman = 754 + year
	} else {
		era = "AC"
		roman = 753 + year
	}
	return (roman, era)
}

//--- Conversión de años romanos con digitos a años romanos con letras ---
func convNumRomano(roman: Int) -> String
{
	let numeros: Array <Int> = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
	let letras: Array <String> = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

	var result: String = ""
	var roman: Int = roman

	while roman > 0
	{
		for (index, numero) in numeros.enumerated()
		{
			if roman - numero >= 0 {
				roman -= numero
				result += letras[index]
				break
			}
		}
	}
	return result
}

//--- Imprimir frase con los datos obtenidos
func imprimirFrase (roman: Int, letras: String, cantidad: Int){
	print("Límite superior es el año \(roman) romano --> \(letras), éste ocupa \(cantidad) espacios para los caracteres.")
}

//--- Encontrar mayor en el rango ---
func maxLetras (LI_f: Int, LS_f: Int) -> Int {
	//variables que irán mutando
	var value: Int = LI_f
	var letras_f: String = ""
	var cantidad: Int = 0
	var max_value: Int = 0
	
	
	//Se genera un array con los valores del rango, uno para las letras del rango y uno para la vantidad de letras del rango
	var myArray: Array <Int> = []
	var myStringArray: Array <String> = []
	var myCountArray: Array <Int> = []
	
	repeat {
		myArray.append(value)							//Se agrega el valor al array de los valores
		letras_f = convNumRomano(roman: value)			//Se convierte el valor en letras romanas
		myStringArray.append(letras_f)					//Se agrega el valor al array de las letras
		cantidad = letras_f.count						//Se convierte las letras romanas en su cantidad
		myCountArray.append(cantidad)					//Se agrega el valor al array de las cantidades de letas
		value+=1
	} while value <= LS_f
	//print(myArray)
	//print(myStringArray)
	//print(myCountArray)

	max_value = myCountArray.max()!
	
	return max_value
}
