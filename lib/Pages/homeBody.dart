// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/customAppBar.dart';
import 'package:auctions_parcial/Pages/searchBar.dart';
import 'package:auctions_parcial/Pages/slider.dart';
import 'package:auctions_parcial/Pages/categories.dart';
import 'package:auctions_parcial/Pages/all_Products.dart';
import 'package:auctions_parcial/Models/model_products.dart';
import 'package:auctions_parcial/Provider/products_provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  //Se declara una lista de tipo ModelProducts con future, ya que se esperará a que products_List sea llenada con datos
  late Future<List<ModelProducts>> proucts_List;

  @override
  void initState() {
    //proucts_List es una instancia de la clase Auctions_Provider
    proucts_List = Auctions_Provider()
        .getProducts(); //Se llama al metodo getProducts de esa clase para obtener los datos de la Api
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se utiliza el FutureBuilder ya que la interfaz está a la espera de que la proucts_List tega los datos de la consutal de la Api
      body: FutureBuilder<List<ModelProducts>>(
          future: proucts_List,
          builder: (context, snapshot) {
            //snapshot.data representa los datos obtenidos
            if (snapshot.hasData) {
              //Se verifica si snapshot.hasData tiene datos o no
              //Se usará el widget SafeArea para mostrar la barra de usuario que tendrá la aplicación
              return SafeArea(
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
                      SearchBar(
                          get_all: () {
                            setState(() {
                              proucts_List = Auctions_Provider().getProducts();
                            });
                          },
                          productsList: snapshot.data!),
                      SizedBox(
                        height: 10,
                      ),
                      //Se crea el slider que contendrá algunas de las imagenes de las subastas
                      Product_Slider(productsList: snapshot.data!),
                      SizedBox(
                        height: 10,
                      ),
                      //Se crea la sección de categorias que tendrá la aplicación
                      Categories(
                        change: (String value_category) {
                          setState(() {
                            proucts_List =
                                Auctions_Provider().getCategory(value_category);
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Se crea la sección de todos los productos
                      Container(
                          height: 300,
                          child: AllProducts(productsList: snapshot.data!)),
                    ],
                  ),
                ),
              );
            } else {
              //En caso de que snapshot.hasData no devuelva nada
              print(snapshot.error);
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
          }),
      drawer: Drawer(),
    );
  }
}
