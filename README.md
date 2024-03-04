# Algoritmo para el cálculo del costo de envío

El proyecto constiste en crear un algoritmo para determinar el costo de envío de un producto, incluyendo cupones de descuentos, destino, y peso del producto.

## Introducción

El desarrollo del algoritmo se realizó en Pseint, por lo que solo es ejecutable en el mismo programa. Consite en realizar una solicitud de datos, como  el precio del producto, cantidad, peso, cupones en caso de existir, y destino. Dado el alcance de Pseint, y que se trata solo de un algoritmo, se realizaron solo validaciones para que el resultado sea un valor congruente con los datos ingresados.

## Instrucciones

- Leer el precio original del producto.
- Aplicar un descuento al producto si es aplicable (por ejemplo, si el cliente tiene un cupón de descuento).
- Aplicar impuestos al producto (por ejemplo, el IVA u otros impuestos).
- Si el cliente compra más de un artículo, aplicar un descuento por cantidad.
- Calcular el costo de envío basado en el destino y el peso del paquete.
- Calcular el costo final del producto sumando el precio con descuento, impuestos, descuento por cantidad y costo de envío.
- Mostrar el costo final del producto, desglosando los diferentes componentes (descuentos, impuestos, descuento por cantidad y costo de envío).

(https://github.com/UDDBootcamp/7M_FULLSTACK_M1_PROY?tab=readme-ov-file#5-requisitos-y-entregables "Requisitos y entregables")

## Desarrollo

Se definen las variables que se utilizarán,
<pre>
Definir precio, promo10, promo5, IVA, precioDesc2, precioIVA, total1, total2,     precioEnvioTotal, posicion, precioxDestino, peso, i, j como Real
Definir cantidad como Entero
Definir destino como Cadena
</pre>

### Variables utilizadas

**cantidad**: Corresponde a la cantidad de pares de zapatos
**promo10**: Descuento de diez porciento (10%) por la compra de un par de zapatos
**promo5**: Descuento cinco porciento (5%) por la compra de dos o más pares de zapatos.
**IVA**: Porcentaje de IVA de doce porciento (12%)
**peso**: Peso en kilogramos (KG) de un par de zapatos

## Versión Pseint

Versión general de la instalación: 20240122
Versiones individuales:
     wxPSeInt 20230615-w32-wx3
     PSeInt 20230904-w32-wx3
     psTerm 20230904-w32-wx3
     psDraw3 20230417-w32-wx3
     psDrawE 20230107-w32-wx3
     psExport 20230904-w32-wx3
     psEval 20190430-w32-wx3
