// //Hecho por Mauricio Canto 11/Feb/2021

import Foundation

//Constantes
let LI: Int = 1//Int.random(in: 0...20)
let LS: Int = 2774


//Variables
var letraLI: String
var letraLS: String
var valorMayor: Int



letraLI = convNumRomano(roman: LI)
letraLS = convNumRomano(roman: LS)

print("Para \(LI) años de la era romana, la conversión en romano es \(letraLI)")
print("Para \(LS) años de la era romana, la conversión en romano es \(letraLS)")

valorMayor = maxLetras (LI_f: LI, LS_f: LS)

print(valorMayor)



//Funciones
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

