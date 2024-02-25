Algoritmo costo_enviozapatos
    Definir precio, promo10, promo5, IVA, precioDesc2, precioIVA, total1, total2, precioEnvioTotal, posicion, precioxDestino, peso, i, j como Real
    Definir cantidad como Entero
    Definir destino como Cadena
	
    //Asignacion de valores 
    IVA <- 0.12 // IVA 12%
	
	// Vector de destinos
	Dimension destinos[5]
	destinos[1] <- "ny"
	destinos[2]<- "pe"
	destinos[3] <- "bo"
	destinos[4]<- "br"
	destinos[5] <- "es"
	
	// Vector de precios fijos de envío por destino
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
			Escribir ("El precio minimo es de $1 por unidad.")
		FinSi
		
	Hasta Que precio >= 1
	
	// Solicita el peso, hasta que sea mayor o igual a 1
	Repetir
		Escribir ("Ingresar peso en KG por producto:")
		leer peso
		
		Si peso <= 0 Entonces
			Escribir ("El precio minimo es de $1 por unidad.")
		FinSi
		
	Hasta Que peso >= 1
	
	// Solicita la cantidad, hasta que sea mayor o igual a 1
	Repetir
		Escribir("Ingresar Cantidad pares de zapatos:")
		leer cantidad
		
		Si cantidad <= 0 Entonces
			Escribir ("El pedido minimo es de 1 par de zapatos.")
		FinSi
		
	Hasta Que cantidad >= 1

	// Solicita ingresar un cupon de descuento. Si el nombre del cupon es "desc1" aplica un 10%. En otro caso, 0%

	Escribir ("Ingresar cupon de descuento 1: Ej. promo10")
	leer descuento1
	Si descuento1 = "promo10" Entonces
		aplicadesc1 <- 0.1 // Descuento 10%
		Escribir("Se ha aplicado un 10% de descuento.")
		Escribir ""
   	Sino 
	    aplicadesc1 <- 0 // Descuento 0
	    Escribir("El cupon ingresado no tiene descuento.")
	    Escribir ""
	FinSi
    	
// Si la cantidad es mayor a 2, solicita ingresar un segundo cupon de descuento. Si el nombre del cupon es "desc2" aplica un 5% adicional. En otro caso, 0%

	Si cantidad >=2 Entonces
		Escribir ("Ingresar cupon de descuento 2: Ej. promo5")
		leer descuento2
		Si descuento2 = "promo5" Entonces
		aplicadesc2 <- 0.05 // Descuento 5% adicional por 2 pares o mas
		Escribir("Se ha aplicado un 5% de descuento.")
		Escribir ""
	Sino
		aplicadesc2 <- 0
		Escribir("El cupon ingresado no tiene descuento.")
		Escribir ""
	FinSi
		
		FinSi


	// Solicita el destino en los formatos indicados
	Escribir("Ingresar Ciudad de destino. Ej. ny, pe, bo, br, es.")
	leer destino
	
	// Recorre el vector destinos, si el valor de destino ingresado por pantalla, es igual al valor del vector en la posición [i], entonces, se cumple la condición,
        // Luego, guarda esa posicion en la que encontro el valor.
	Para i<-1 Hasta 5 Con Paso 1 Hacer		
		
		Si destinos[i] = destino Entonces
			posicion <- i
		FinSi
		
	FinPara
	
	// Recorre el vector PrecioDestino, si la posición del vector precioDestino es igual a la encontrada en destino [i], se cumple la condicion, entonces
       // Guarda el valor de la posicion de PrecioDestino, en una variable llamada "pdestino".
	Para j<-1 Hasta 5 con paso 1 Hacer
		
		Si posicion == j 
			Escribir ("El costo fijo de envio al destino es:")
			Escribir precioDestino[j]
			pdestino <- precioDestino[j]
		FinSi
		
	FinPara
	
	// Se convierte a numero, ya estaba definida como cadena y arrojaba error en el calculo de precioEnvioTotal
	precioxDestino <- ConvertirANumero(pdestino)

     // Condicion para el envío de 2 o más pares, o en caso contrario, para 1 par de zapatos.
	Si cantidad >= 2 Entonces
		precio <- precio * (1 - aplicadesc1) // Aplicar descuento del 10% 
		precioIVA <- precio * (1 + IVA) // Monto con IVA
		precioDesc2 <- precioIVA * (1 - aplicadesc2) // Precio con 5% adicional de descuento por 2 o mas pares
		total1 <- precioDesc2 * cantidad // Total iva incluido, antes de envio
		precioEnvioTotal <- precioxDestino + cantidad  * peso //Costo de destino fijo, mas kg por par de zapatos
	SiNo 
		precio <- precio * (1 - aplicadesc1) // Aplicar descuento del 10%  
		precioIVA <- precio * (1 + IVA) // Monto con IVA
		total1 <- precioIVA * cantidad // Total iva incluido, antes de envio
		precioEnvioTotal <- precioxDestino + cantidad * peso // Costo de destino fijo, mas kg por par de zapatos
	FinSi
	
   // Calcula el total final a pagar
    total2 <- total1 + precioEnvioTotal
    
    // Muestra los resultados deglosados
    Escribir("Precio unitario descuento 10% <promo10>: ")
    Escribir(precio)
    
    Escribir("Precio + 12% IVA: ")
    Escribir(precioIVA)
    
    Escribir("Cantidad de pares: ")
    Escribir(cantidad)
    
    Escribir("Precio 5% adicional <promo5>:")
    Escribir(precioDesc2)
    
    Escribir("Total antes de envio:")
    Escribir(total1)
	
    Escribir("Costo de envio total:")
    Escribir(precioEnvioTotal)
    
    // Mostrar el total final
    Escribir("Total final a pagar: ")
    Escribir(total2)
	
FinAlgoritmo
