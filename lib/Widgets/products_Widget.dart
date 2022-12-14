import 'dart:convert';
import 'dart:html';

// Se importa el paquete material.dart
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Models/model_products.dart';

Widget Products_Widget(ModelProducts data) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    //Se crea el contenedor que tendrá cada imagen
    Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 2, color: primaryColor, style: BorderStyle.solid),
      ),
      child: Image.network(
        data.imgURL,
      ), //Se le asigna la imagen
    ),
    // Se crea un listTile que contenga el nombre, la descripción y el icono de favorito
    Container(
      width: 200,
      height: 100,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 180,
            child: ListTile(
              title: Text((data.title.length > 30)
                  ? data.title.substring(0, 30)
                  : data.title),
              subtitle: Text(
                "${data.price}",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ), //para que puestre solo 20 caracteres de la descripción
              //Se usa el widget trailing para crear la opción de favorito que tendrá la app
            ),
          ),
          Container(
            height: 30,
            width: 180,
            child: FlatButton(
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
  ]);
}
