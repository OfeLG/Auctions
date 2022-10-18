// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';

class Category_Products extends StatelessWidget {
  const Category_Products({
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
                  height: 10,
                ),
                Image.asset(
                  image,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
