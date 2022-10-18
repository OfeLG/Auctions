// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/customAppBar.dart';
import 'package:auctions_parcial/Pages/searchBar.dart';
import 'package:auctions_parcial/Pages/slider.dart';
import 'package:auctions_parcial/Pages/categories.dart';
import 'package:auctions_parcial/Pages/all_Products.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Se usará el widget SafeArea para mostrar la barra de usuario que tendrá la aplicación
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //Se crea el appbar de la app
              CustomAppBar(),
              //Espacio entre la barra principal y la barra de busqueda
              SizedBox(
                height: 10,
              ),
              //Se crea la columna que tendrá en su interior una fila --------------------
              SearchBar(),
              SizedBox(
                height: 10,
              ),
              //Se crea el slider que contendrá algunas de las imagenes de las subastas
              Product_Slider(),
              SizedBox(
                height: 10,
              ),
              //Se crea la sección de categorias que tendrá la aplicación
              Categories(),
              SizedBox(
                height: 10,
              ),
              //Se crea la sección de todos los productos
              Container(height: 300, child: AllProducts()),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
