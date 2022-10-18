// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/category_products.dart';
import 'package:flutter/rendering.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    //Se crea un contenedor con el fin de colocarle una altura a todo lo que se encuentra en lisview
    return Container(
      height: 100,
      //Se crea un listView que contenga cada una de las categorias para así poderle colocar desplazamiento horizontal
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category_Products(
            press: () {},
            text: "Vestidos",
            image: "assets/prenda1.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {},
            text: "Abrigos",
            image: "assets/prenda2.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {},
            text: "Camison",
            image: "assets/prenda3.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {},
            text: "Faldas",
            image: "assets/prenda4.jpg",
          ),
        ],
      ),
    );
  }
}
