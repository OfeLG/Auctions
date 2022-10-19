import 'dart:convert';
import 'dart:html';
// Se importa la libreria carousel_pro.dart con el fin de usar las propiedades de carousel
import 'package:carousel_pro/carousel_pro.dart';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Models/model_products.dart';

List<Widget> Widget_Carousel(List<ModelProducts> data) {
  //products se crea para agregar en él la lista de widgets (en este caso serán imagenes las que se agregarán)
  List<Widget> products = [];
  int cont = 0;
  for (var product in data) {
    //Se recorre la lista (data) qcon el fin de ir agregando uno a uno sus elementos a un widget Image
    products.add(
      Image.network(product.imgURL),
    );
    if (cont == 10) {
      break;
    }
    cont++;
  }
  return (products);
}
