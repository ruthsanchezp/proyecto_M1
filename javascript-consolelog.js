
let precio = 100; // Precio unitario
const  peso = 3; // Peso por par
const desc2 = 0.05;  // Descuento 5% adicional por 2 pares o más
const desc1 = 0.1; // Descuento 10%
const IVA = 0.12; // IVA 12%
let precioDesc2 = 0; // Precio con descuento 5% adicional por 2 pares, inicializado en 0
let precioIVA; // Precio + IVA 12%
let total1; // Total IVA incluído, por cantidad de pares     
let precioEnvio; // Precios de envío por destino
let total2; // Total final con precio de envío incluído    


const destinos = { // Precios de envío por destino
    "New York": 10,
    "Santiago": 20,
    "Lima": 30
};

function calcular(cantidad, destino) {
   
    cantidad = Math.abs(cantidad); // Por si se ingresara un número negativo 

  if (cantidad === 0){ // si se ingresa cantidad 0
        cantidad = 1;
    }

    if (cantidad >= 2) {
       
        precio = precio * (1 - desc1); //Precio con descuento 10%
        precioIVA = precio * (1 + IVA); // Precio + IVA 12%
        precioDesc2 = precioIVA * (1 - desc2); //Precio con descuento 5% adicional por 2 pares
        total1 = precioDesc2 * cantidad; // Total IVA incluído, por cantidad de pares con descuentos incluidos


    } else {
       
        precio = precio * (1 -desc1 ); //Precio con descuento 10%
        precioIVA = precio * (1 + IVA); // Precio + IVA 12%
        total1 = precioIVA * cantidad;  // Total IVA incluído, por 1 par de zapato, con descuento incluido
    }

 
    precioEnvio = destinos[destino] + cantidad * peso; // Precios de envío por destino
    total2 = total1 + precioEnvio; // Total final
    console.log('Destino:', destino); // Mostrar destino
    console.log('Precio unitario con 10% descuento:', precio); // Mostrar precio unitario con descuento 10%
    console.log('Precio + 12%  IVA;', precioIVA); // Mostrar precio + IVA 12%
    console.log('Precio - 5% descuento despues de impuestos:', precioDesc2);   // Mostrar precio con descuento 5% adicional por 2 pares o más
    console.log('Subtotal por', cantidad, 'Pares:', total1); // Mostrar subtotal por cantidad de pares
    console.log('Cantidad de pares:', cantidad);// Mostrar cantidad de pares
    console.log('Precio envio:', precioEnvio);// Mostrar precio de envío

    return total2; // Retornar total final
}

const ingresoCantidad = calcular(3, "New York"); // ingresar cantidad de pares y destino. Ejemplo: 2, New York
console.log(ingresoCantidad); // Mostrar total final