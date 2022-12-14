// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';

//Se usará un estateles ya que solo se mostrarán las categorias
class Category_Products extends StatelessWidget {
  const Category_Products({
    //Se indica que datos se desean mostrar
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback
      press; //Con el fin de mantener un flujo continuo de datos, se define la función (VoidCallback) que se supone que debe activarse como una devolución de llamada cuando ocurre un evento específico.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Se utiliza un GestureDetector y en el opTap para devolver un valor en caso de que se seleccione el contendor de la categoria
      child: GestureDetector(
        onTap: press,
        child: Container(
          //Se utilizará el widget chip, ya que es un elemento compacto que contiene un icono y texto
          child: Chip(
            backgroundColor: primaryColor,
            label: Row(
              children: [
                Text(text),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    image,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
