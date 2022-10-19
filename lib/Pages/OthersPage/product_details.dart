// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/enum.dart';
import 'package:auctions_parcial/Widgets/products_Widget.dart';
import 'package:auctions_parcial/Models/model_products.dart';

class Details extends StatefulWidget {
  //Se recibirá un objeto de tipo ModelProducts para mostrar los datos del producto seleccionado
  final ModelProducts product;

  const Details({super.key, required this.product});
  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = false;
  final Color inactiveColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del producto"),
      ),
      body: Container(
        width: 200,
        height: 500,
        child: Column(
          children: [
            //Se crea el contenedor que tendrá cada imagen
            Container(
              height: 250,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2, color: primaryColor, style: BorderStyle.solid),
              ),
              child: Stack(
                //Se usa el stack para que dos widgets se sobrepongan (en este caso, el container del favorite encima de la imagen)
                children: [
                  Center(
                    child: Image.network(
                      widget.product.imgURL,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      //Se indica la acción que tendrá el icono en caso de darle click
                      onPressed: () {
                        setState(() {
                          isLike = !isLike;
                        });
                        favoriteList.add(widget.product);
                      },
                      //Se le asigna el icono
                      icon: Icon(
                        isLike
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isLike ? Colors.red : inactiveColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ), //Se le asigna la imagen
            ),
            // Se crea un listTile que contenga el nombre, la descripción y el icono de favorito
            Container(
              height: 50,
              child: ListTile(
                title: Text((widget.product.title)),
                subtitle: Text(
                  "${widget.product.price}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ), //para que puestre solo 20 caracteres de la descripción
                //Se usa el widget trailing para crear la opción de favorito que tendrá la app
              ),
            ),
            Container(
              height: 50,
              child: Text(
                widget.product.description,
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ),
            Container(
              height: 200,
              width: 50,
              child: FlatButton(
                //En caso de dar click, se agregara el producto a (proposiciones realizadas)
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                child: Text(
                  "Proponer",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
*/