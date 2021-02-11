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
var a1: Int = 2000  //Int.random(in: -753...2021)	//es el valor inferior en el rango de años que se evaluará, el rango máximo va desde el Anno Urbis Conditae que es el 753BC hasta el 2021AC
var a2: Int = 2012							//es el valor superiro en el rango de años que se evaluará.
var era1: String 		//decide si es BC o AC para a1, si es BC hay que restarle a 754 el valor de los años, si es AC hay que sumarle al valor de los años 753, de esta manera se obtiene el valor como usaban los romanos
var era2: String 		//decide si es BC o AC para a2
var roman1: Int			//para guardar el valor del año romano en dígitos para a1
var roman2: Int			//para guardar el valor del año romano en dígitos para a2
var letras1: String	= ""	//para guardar el valor del año romano en letras para a1
var letras2: String	= ""	//para guardar el valor del año romano en letras para a2
var letrasmax: String	//para guardar el valor del año romano con mayor cantidad de letras dentro del rango a1-a2
var salida: Int 		//Es el valor entero final que será la salida con el número mínimo de caracteres reservdos para el número del año en romano con letras


/*
print("\n\(a1)\n")
repeat  {
	a2 = Int.random(in: -753...2021)
	print (a2)

} while a2 <= a1
print()
print (a1)
print (a2)
*/



(roman1, era1) = romanonumero(year: a1)
(roman2, era2) = romanonumero(year: a2)



//Datos de entrada
print("\nDatos de entrada \n   \(abs(a1))\(era1)-\(abs(a2))\(era2)")

//años en romano con dígitos
print("\nAños romanos en dígitos \n   \(roman1)-\(roman2)")


//*** Funciones ***
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

//Millares
if roman1 >= 1000  {
	letras1 += "M"
	roman1 -= 1000
	if roman1 >= 1000 {
		letras1 += "M"
		roman1 -= 1000
	}
}
print(letras1)
print(roman1)


//Centenas
if roman1 >= 900 && roman1 <= 999{
	letras1 += "CM"
	roman1 -= 900
} else if roman1 >= 500 && roman1 <= 899{
	letras1 += "D"
	roman1 -= 500
	if roman1 >= 100 && roman1 <= 399 {
		letras1 += "C"
		roman1 -= 100
		if roman1 >= 100 && roman1 <= 299 {
			letras1 += "C"
			roman1 -= 100
			if roman1 >= 100 && roman1 <= 199 {
				letras1 += "C"
				roman1 -= 100
			}
		}
	}
} else if roman1 >= 400 && roman1 <= 499{
	letras1 += "CD"
	roman1 -= 400
} else if roman1 >= 100 && roman1 <= 399 {
	letras1 += "C"
	   roman1 -= 100
	   if roman1 >= 100 && roman1 <= 299 {
		   letras1 += "C"
		   roman1 -= 100
		   if roman1 >= 100 && roman1 <= 199 {
			   letras1 += "C"
			   roman1 -= 100
		   }
	   }
   }
print(letras1)
print(roman1)

//Decenas
if roman1 >= 90 && roman1 <= 99{
	letras1 += "XC"
	roman1 -= 90
} else if roman1 >= 50 && roman1 <= 89{
	letras1 += "L"
	roman1 -= 50
	if roman1 >= 10 && roman1 <= 39 {
		letras1 += "X"
		roman1 -= 10
		if roman1 >= 10 && roman1 <= 29 {
			letras1 += "X"
			roman1 -= 10
			if roman1 >= 10 && roman1 <= 19 {
				letras1 += "X"
				roman1 -= 10
			}
		}
	}
} else if roman1 >= 40 && roman1 <= 49{
	letras1 += "XL"
	roman1 -= 40
} else if roman1 >= 10 && roman1 <= 39 {
	letras1 += "X"
	   roman1 -= 10
	   if roman1 >= 10 && roman1 <= 29 {
		   letras1 += "X"
		   roman1 -= 10
		   if roman1 >= 10 && roman1 <= 19 {
			   letras1 += "X"
			   roman1 -= 10
		   }
	   }
   }


print(letras1)
print(roman1)

//Unidades
if roman1 >= 9 && roman1 <= 9{
	letras1 += "IX"
	roman1 -= 9
} else if roman1 >= 5 && roman1 <= 8{
	letras1 += "V"
	roman1 -= 5
	if roman1 >= 1 && roman1 <= 3 {
		letras1 += "I"
		   roman1 -= 1
		   if roman1 >= 1 && roman1 <= 2 {
			   letras1 += "I"
			   roman1 -= 1
			   if roman1 >= 1 && roman1 <= 1 {
				   letras1 += "I"
				   roman1 -= 1
			   }
		   }
	   }
} else if roman1 >= 4 && roman1 <= 4{
	letras1 += "IV"
	roman1 -= 4
} else if roman1 >= 1 && roman1 <= 3 {
	letras1 += "I"
	   roman1 -= 1
	   if roman1 >= 1 && roman1 <= 2 {
		   letras1 += "I"
		   roman1 -= 1
		   if roman1 >= 1 && roman1 <= 1 {
			   letras1 += "I"
			   roman1 -= 1
		   }
	   }
   }


print(letras1)
print(roman1)

/*
1 -> I		1
2 -> II		2
3 -> III	3  -
4 -> IV		2
5 -> V		1
6 -> VI		2
7 -> VII	3  -
8 -> VIII	4  --
9 -> IX		2
10 -> X		1
11 -> XI	2
12 -> XII	3
13 -> XIII	4
14 -> XIV 	3



88 -> LXXX VIII

2753 -> MM DCC L III = 9
2758 -> MM DCC L VIII = 10
2765 -> MM DCC LX V = 8


1200 MCC
1888 M DCCC LXXX VIII
2000  MM

753BC -> 1 -> I		->1
756BC -> 3 -> III	->3
747BC -> 7 -> VII	->3
Output must be:
3

1000  	M
...
1188	M C LXXX VIII
...
1200 	M CC

array [LI ... LS]
search 80s   		4 +
	search 30 y 7	3 +
		search 2	2 +

filter

includes

*/

