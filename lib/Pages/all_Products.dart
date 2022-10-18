// Se importa el paquete material.dart
import 'package:auctions_parcial/Pages/slider.dart';
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';

class AllProducts extends StatelessWidget {
  //Se crea la lista de todos los productos
  final allProductsList = [
    {
      "name": "Vestido",
      "image": "assets/prenda1.jpg",
      "price": "20.000",
      "description":
          "Vestido hermoso de encaje de porcelana procediente de 3 años antes de cristo",
    },
    {
      "name": "Vestido",
      "image": "assets/prenda1.jpg",
      "price": "20.000",
      "description":
          "Vestido hermoso de encaje de porcelana procediente de 3 años antes de cristo",
    },
    {
      "name": "Vestido",
      "image": "assets/prenda1.jpg",
      "price": "20.000",
      "description":
          "Vestido hermoso de encaje de porcelana procediente de 3 años antes de cristo",
    }
  ];

  @override
  Widget build(BuildContext context) {
    //Se crea la cuadricula de cuantas columnas se desea mostrar
    return GridView.builder(
      itemCount: allProductsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (BuildContext context, index) {
        //Sele asignan los datos
        return AllSingleProducts(
          all_single_product_description: allProductsList[index]["description"],
          all_single_product_name: allProductsList[index]["name"],
          all_single_product_image: allProductsList[index]["image"],
          all_single_product_price: allProductsList[index]["price"],
        );
      },
    );
  }
}

//Se crea una clase que contendrá los productos de forma individual
class AllSingleProducts extends StatefulWidget {
  final all_single_product_name;
  final all_single_product_image;
  final all_single_product_price;
  final all_single_product_description;

  AllSingleProducts({
    this.all_single_product_name,
    this.all_single_product_image,
    this.all_single_product_price,
    this.all_single_product_description,
  });

  @override
  State<AllSingleProducts> createState() => _AllSingleProductsState();
}

class _AllSingleProductsState extends State<AllSingleProducts> {
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = false;
  final Color inactiveColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Se crea el contenedor que tendrá cada imagen
        Container(
          height: 130,
          width: 160,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
              widget.all_single_product_image), //Se le asigna la imagen
        ),
        // Se crea un listTile que contenga el nombre, la descripción y el icono de favorito
        ListTile(
          title: Text(widget.all_single_product_name),
          subtitle: Text("${widget.all_single_product_description}"),
          //Se usa el widget trailing para crear la opción de favorito que tendrá la app
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              //Se indica la acción que tendrá el icono en caso de darle click
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                });
              },
              //Se le asigna el icono
              icon: Icon(
                isLike ? Icons.favorite : Icons.favorite_border_outlined,
                color: isLike ? Colors.red : inactiveColor,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
