//Hecho por Mauricio Canto 08/Feb/2021

import Foundation

var T: Int
//var emptyDoubles: [Double] = []
var N: [Int] = []
var M: [Int] = []
var flecha: [String] = []
let instrucciones: String = """
#Ejercicio 1
Starting at the top left corner of an N x M grid and facing towards the right, you keep walking one square at a time in the direction you are facing. If you reach the boundary of the grid or if the next square you are about to visit has already been visited, you turn right. You stop when all the squares in the grid have been visited. What direction will you be facing when you stop? For example: Consider the case with N = 3, M = 3. The path followed will be (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2) -> (2,1) -> (2,0) -> (1,0) -> (1,1). At this point, all squares have been visited, and you are facing right.

## Especificación de entrada
The first line contains T the number of test cases. Each of the next T lines contain two integers N and M, denoting the number of rows and columns respectively.

## Especificación de salida
Output T lines, one for each test case, containing the required direction you will be facing at the end. Output L for left, R for right, U for up, and D for down. 1 <= T <= 5000, 1 <= N,M <= 10^9.

## Ejemplo de entrada
4
1 1
2 2
3 1
3 3

## Ejemplo de salida
R
L
D
R

"""

print(instrucciones)
print("Para empezar, introduzca el valor de T para saber cuántas 'Test Cases' desea.\nValor de T = ")
T = 3

for i in 0..<T {
	print("Para la 'Test Case' \(i) introduzca el valor que quiere para N y luego para M.\nValor de N = ")
	N.append(2 + i)
	print("N[\(i)] = \(N[i])")
	print("Valor de M = ")
	M.append(i)
	print("M[\(i)] = \(M[i])")

	if N[i] >= M[i] {
		if N[i] % 2 == 0 {
			flecha.append("L")
		} else if N[i] % 2 != 0 {
			flecha.append("R")
		}
	} else if N[i] < M[i] {
		if N[i] % 2 == 0 {
			flecha.append("U")
		} else if N[i] % 2 != 0 {
			flecha.append("D")
		}
	}
	
}

print("N = \(N)")
print("M = \(M)")
print("Direcciones = \(flecha)")

print(T)
for i in 0..<T{
print("\(N[i])  \(M[i])")
}

for i in 0..<T {
	print(flecha[i])
}

//solo números,  rangos que se solicitan, nils


