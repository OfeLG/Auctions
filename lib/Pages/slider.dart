// Se importa el paquete material.dart
import 'package:auctions_parcial/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Product_Slider extends StatefulWidget {
  @override
  State<Product_Slider> createState() => _Product_SliderState();
}

class _Product_SliderState extends State<Product_Slider> {
  @override
  Widget build(BuildContext context) {
    //Se crea el contenedor que tendrá al Slider
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200, //Se define una altura al contenedor
        child: Carousel(
          images: [
            AssetImage('assets/prenda1.jpg'),
            AssetImage('assets/prenda2.jpg'),
            AssetImage('assets/prenda3.jpg'),
            AssetImage('assets/prenda4.jpg'),
          ],
          //Se añade animación al carousel
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(
            milliseconds: 800,
          ),
          borderRadius: true,
          radius: Radius.circular(30),
          //Poner transparente la sección de los puntos del carousel
          dotBgColor: Colors.transparent,
          //Que el punto de la imagen mostrada cambie de color
          dotIncreasedColor: primaryColor,
        ),
      ),
    );
  }
}
