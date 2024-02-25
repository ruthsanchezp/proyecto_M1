Algoritmo costo_enviozapatos
    Definir precio, desc1, desc2, IVA, precioDesc2, precioIVA, total1, total2, precioEnvioTotal, posicion, precioxDestino, peso, i, j como Real
    Definir cantidad como Entero
	Definir destino como Cadena
	
	//Asignaci�n de valores 
    desc1 <- 0.1 // Descuento 10%
    desc2 <- 0.05 // Descuento 5% adicional por 2 pares o m�s
    IVA <- 0.12 // IVA 12%
	
	// Vector de destinos
	Dimension destinos[5]
	destinos[1] <- "ny"
	destinos[2]<- "pe"
	destinos[3] <- "bo"
	destinos[4]<- "br"
	destinos[5] <- "es"
	
	// Vector de precios  fijos por destino
	Dimension precioDestino[5]
	precioDestino[1] <- "10"
	precioDestino[2]<- "20"
	precioDestino[3]<- "30"
	precioDestino[4]<- "40"
	precioDestino[5]<- "50"
	
	// Solicita ingresar el precio, hasta que sea mayor o igual a 1
	Repetir
		Escribir ("Ingresar precio producto:")
		leer precio
		
		Si precio <= 0 Entonces
			Escribir ("El precio m�nimo es de $1 por unidad.")
		FinSi
		
	Hasta Que precio >= 1
	
	// Solicita el peso, hasta que sea mayor o igual a 1
	Repetir
		Escribir ("Ingresar peso en KG por producto:")
		leer peso
		
		Si peso <= 0 Entonces
			Escribir ("El precio m�nimo es de $1 por unidad.")
		FinSi
		
	Hasta Que peso >= 1
	
	// Solicita la cantidad, hasta que sea mayor o igual a 1
	Repetir
		Escribir("Ingresar Cantidad de zapatos:")
		leer cantidad
		
		Si cantidad <= 0 Entonces
			Escribir ("El pedido m�nimo es de 1 unidad.")
		FinSi
		
	Hasta Que cantidad >= 1
	
	//Solicita el destino en los formatos indicados
	Escribir("Ingresar Ciudad de destino. Ej. ny, pe, bo, br, es.")
	leer destino
	
	//Recorre el vector destinos, y busca que el destino que se ingresa por pantalla concida con alg�n valor del vector
	//Si se cumple, guarda esa posicion en la que encontr� el valor.
	Para i<-1 Hasta 5 Con Paso 1 Hacer		
		
		Si destinos[i] = destino Entonces
			posicion <- i
		FinSi
		
	FinPara
	
	// Recorre el vector PrecioDestino, y busca que la posicion del vector encontrada en destinos, sea igual a la de PrecioDestino
	//Si se cumple la condicion, guarda el valor de la posici�n de PrecioDestino, en una variable llamada "pdestino".
	Para j<-1 Hasta 5 con paso 1 Hacer
		
		Si posicion == j 
			Escribir ("El costo fijo de env�o al destino es:")
			Escribir precioDestino[j]
			pdestino <- precioDestino[j]
		FinSi
		
	FinPara
	
	// Se convierte a n�mero, ya estaba definida como cadena y arrojaba error en el calculo de precioEnvioTotal
	precioxDestino <- ConvertirANumero(pdestino)
	
	Si cantidad >= 2 Entonces
		precio <- precio * (1 - desc1) // Aplicar descuento del 10% 
		precioIVA <- precio * (1 + IVA) // Monto con IVA
		precioDesc2 <- precioIVA * (1 - desc2) // Precio con 5% adicional de descuento por 2 o m�s pares
		total1 <- precioDesc2 * cantidad // Total iva inclu�do, antes de env�o
		precioEnvioTotal <- precioxDestino + cantidad  * peso //Costo de destino fijo, mas kg por par de zapatos
	SiNo 
		precio <- precio * (1 - desc1) // Aplicar descuento del 10%  
		precioIVA <- precio * (1 + IVA) // Monto con IVA
		total1 <- precioIVA * cantidad // Total iva inclu�do, antes de env�o
		precioEnvioTotal <- precioxDestino + cantidad * peso // Costo de destino fijo, mas kg por par de zapatos
	FinSi
	
	// Calcular el total final a pagar
    total2 <- total1 + precioEnvioTotal
    
    // Mostrar los resultados
    Escribir("Precio unitario con 10% descuento: ")
    Escribir(precio)
    
    Escribir("Precio + 12% IVA: ")
    Escribir(precioIVA)
    
	Escribir("Cantidad de pares: ")
    Escribir(cantidad)
    
	Escribir("Precio con 5% descuento adicional, por cantidad: ")
    Escribir(precioDesc2)
    
    Escribir("Total antes de env�o:")
    Escribir(total1)
	
    Escribir("Precio total de env�o al destino:")
    Escribir(precioEnvioTotal)
    
    // Mostrar el total final
    Escribir("Total final a pagar: ")
    Escribir(total2)
	
FinAlgoritmo