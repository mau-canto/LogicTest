//Hecho por Mauricio Canto 10/Feb/2021

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
var romanmax: Int			//para guardar el valor del año romano con mayor cantidad de números dentro del rango a1-a2
var letrasmax: String		//para guardar el valor del año romano con mayor cantidad de letras dentro del rango a1-a2
var salida: Int 			//Es el valor entero final que será la salida con el número mínimo de caracteres reservdos para el número del año en romano con letras


//Valores temporales default
a1 = 2000
a2 = 2012

print(instrucciones)

//Datos generados aleatoriamente para establecer un rango
(a1, a2) = datosAleatorios(year1: a1, year2: a2 ) //si se quiere usar los valores default, comentar esta línea

//Convertior datos aleatorios en el dato de entrada
(roman1, era1) = romanonumero(year: a1)
(roman2, era2) = romanonumero(year: a2)

//Datos de entrada
print("\nDatos de entrada \n   \(abs(a1))\(era1)-\(abs(a2))\(era2)")

//años en romano con dígitos
print("\nAños romanos en dígitos \n   \(roman1)-\(roman2)")

//años en romano con letras
letras1 = convNumRomano(roman: roman1)
letras2 = convNumRomano(roman: roman2)

print("Límite inferior es el año \(roman1) --> \(letras1)")
print("Límite superior es el año \(roman2) --> \(letras2)")



//*** Funciones ***
//--- Generar datos aleatorios ---
func datosAleatorios(year1: Int, year2: Int ) -> (Int, Int){
	var year1: Int = year1  //a1 fuera de la función
	var year2: Int = year2  //a2 fuera de la función
	year1 = Int.random(in: -753...2020) //se da un valor aleatorio al valor inferior del rango de años
	print("\n\(year1)\n")
	repeat  {
		year2 = Int.random(in: -753...2021) //se da un valor aleatorio al valor superior del rango de años
		print (year2)

	} while year2 <= year1 //si el valor del límite superior sale menor que el inferior se repite hasta que se consigue uno mayor
	print()
	print (year1)
	print (year2)
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

