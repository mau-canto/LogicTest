//Hecho por Mauricio Canto 10/Feb/2021

import Foundation

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

print(instrucciones)

//datos de entrada
//años en BC o AC
var a1: Int = Int.random(in: -753...2021)	//es el valor inferior en el rango de años que se evaluará, el rango máximo va desde el Anno Urbis Conditae que es el 753BC hasta el 2021AC
var a2: Int									//es el valor superiro en el rango de años que se evaluará.
var era1: String 		//decide si es BC o AC para a1, si es BC hay que restarle a 754 el valor de los años, si es AC hay que sumarle al valor de los años 753, de esta manera se obtiene el valor como usaban los romanos
var era2: String 		//decide si es BC o AC para a2
var roman1: Int			//para guardar el valor del año romano en dígitos para a1
var roman2: Int			//para guardar el valor del año romano en dígitos para a2


print("\n\(a1)\n")
repeat  {
	a2 = Int.random(in: -753...2021)
	print (a2)

} while a2 <= a1
print()
print (a1)
print (a2)

if a1 < 0 {
	era1 = "BC"
	roman1 = 754 + a1
} else {
	era1 = "AC"
	roman1 = 753 + a1
}

if a2 < 0 {
	era2 = "BC"
	roman2 = 754 + a2
} else {
	era2 = "AC"
	roman2 = 753 + a2
}

//Datos de entrada
print("\nDatos de entrada \n   \(abs(a1))\(era1)-\(abs(a2))\(era2)")

//años en romano con números
print("\nAños romanos en dígitos \n   \(roman1)-\(roman2)")


