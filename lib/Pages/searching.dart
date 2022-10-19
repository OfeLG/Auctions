import 'dart:html';

import 'package:flutter/material.dart';

import '../Models/model_products.dart';
import '../Widgets/products_Widget.dart';

//Se crea un clase que extienda de SearchDelegate con el fin realizar la busqueda de productos
class Searching extends SearchDelegate<ModelProducts> {
  final List<ModelProducts>
      productsList; //Se crea esta lista, para que Searching resiva por parametro la lista de la cual se construirá las sugerencias

  List<ModelProducts> _filter = [];

  Searching(this.productsList);
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Se crea el icono (X) de eliminar contenido que trae normalmente un buscador
    return [
      IconButton(
        onPressed: () {
          query =
              ""; //query es un String interno de SearchDelegate, por lo que al precionar la (X) se eliminará lo que esté escrito
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      //Al da click se mostrá la pagina de home
      onPressed: () {
        //Se llama a la función close de SearchDelegate y se le pasa el modelProduct vacio, ya que no se necesitará un resultado
        close(
            context,
            ModelProducts(
                price: 0,
                imgURL: '',
                category: '',
                title: '',
                description: ''));
      },
      //Se le agrega el icono de retroceder
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Muentra el resltado cuando se le de click en la opción buscar del tetlado
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (context, index) {
        return Products_Widget(_filter[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Es para que al escribir se vaya construyendo alguna sugerencia
    //Se gurdará en _filter todos los datos de productList que tengan relación con lo que se busque
    _filter = productsList.where((product) {
      return product.title.toLowerCase().contains(query.trim().toLowerCase());
    }).toList(); //Convertir todo a lista
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (context, index) {
        return Products_Widget(_filter[index]);
      },
    );
  }
}
